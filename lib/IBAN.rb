require 'yaml'

class IBAN
  def self.validation_rules
    @@rules ||= YAML.load_file(File.expand_path('iban/rules.yml', File.dirname(__FILE__)))
  end
  
  def initialize(code)
    @code = code.strip.gsub(/\s+/, '').upcase
  end
  
  def country_code
    @code[0..1]
  end
  
  def check_digits
    @code[2..3]
  end
  
  def bban
    @code[4..-1]
  end
    
  def to_i
    "#{bban}#{country_code}#{check_digits}".each_byte.map do |byte|
      case byte
      when 48..57 then byte - 48 # 0..9 # or byte.chr
      when 65..90 then byte - 55 # A..Z
      else raise RuntimeError.new("Unexpected byte '#{byte}' in IBAN code '#{@code}'")
      end
    end.join.to_i
  end
  
  def to_s(formatted=false)
    formatted ? @code.gsub(/(.{4})/, '\1 ').strip : @code
  end
  
  def valid?
    valid_check_digits? && valid_length? && valid_bban?
  end
  
  def valid_check_digits?
    to_i % 97 == 1
  end
  
  def valid_length?
    validation_rule && validation_rule['length'] == @code.length
  end
  
  def valid_bban?
    validation_rule && !!(bban =~ Regexp.new("^#{validation_rule['regexp']}$"))
  end
  
  private
  
  def validation_rule
    self.class.validation_rules[country_code.downcase]
  end
end
class IBAN
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
  
  def valid?
    to_i % 97 == 1
  end
    
  def to_i
    (bban + country_code + check_digits).each_byte.map do |byte|
      case byte
      when 48..57 then byte.chr  # 0..9
      when 65..90 then byte - 55 # A..Z
      else raise RuntimeError.new("Unexpected byte #{byte} in IBAN code '#{@code}'")
      end
    end.join.to_i
  end
  
  def to_s(formatted=false)
    formatted ? @code.gsub(/(.{4})/, '\1 ').strip : @code
  end
end
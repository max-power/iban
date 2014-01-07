require 'active_model/validator'

class IbanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless value.nil? || IBAN.valid?(value)
  end
end
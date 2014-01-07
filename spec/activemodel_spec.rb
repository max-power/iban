require 'spec_helper'

class Company
  include ActiveModel::Model

  attr_accessor :iban, :name
  validates :iban, iban: true

  def persisted?
    false
  end
end

describe IbanValidator do
  before {
    @model = Company.new
  }
  
  it "should be valid" do
    @model.iban = 'FR1420041010050500013M02606'
    @model.valid?.must_equal true
  end

  it "should not be valid" do
    @model.iban = 'FR1420041010050500013'
    @model.valid?.must_equal false
    @model.errors[:iban].must_include "is invalid"
  end

  it "should be valid for nil values (use the presence validator)" do
    @model.iban = nil
    @model.valid?.must_equal true
  end
end

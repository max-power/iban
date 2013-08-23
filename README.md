# International Bank Account Number

IBAN information, validation and formatting.
Ships with an ActiveModel validator.

[![Build Status](https://travis-ci.org/max-power/iban.png?branch=master)](https://travis-ci.org/max-power/iban)

## Installation

Add this line to your application's Gemfile:

    gem 'IBAN'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install IBAN

## Usage

    iban = IBAN.new("DE89 3704 0044 0532 0130 00")

    iban.country_code    # "DE"
    iban.check_digits    # "89"
    iban.bban            # "370400440532013000"
    iban.account_number  # "0532013000"
    iban.bank_identifier # "37040044"

    iban.valid?          # true

    iban.to_s            # "DE89370400440532013000"
    iban.to_s(true)      # "DE89 3704 0044 0532 0130 00"

    iban.to_i            # 370400440532013000131489
    
    # or 
    
    IBAN.valid? "DE89 3704 0044 0532 0130 00" # true


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

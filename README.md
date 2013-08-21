# IBAN: International Bank Account Number

IBAN validation and formatting

## Installation

Add this line to your application's Gemfile:

    gem 'iban'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iban

## Usage

    iban = IBAN.new('GR16 0110 1250 0000 0001 2300 695')

    iban.country_code # GR
    iban.check_digits # 16
    iban.bban         # 01101250000000012300695

    iban.valid?       # true

    iban.to_s         # 'GR1601101250000000012300695'
    iban.to_s(true)   # 'GR16 0110 1250 0000 0001 2300 695'

    iban.to_i         # 1101250000000012300695162716
    
    # or 
    
    IBAN.valid? 'GR16 0110 1250 0000 0001 2300 695' # true


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

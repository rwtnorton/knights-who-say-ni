# KnightsWhoSayNi

Counts the number of legal positions of two opposing knights on
an N x M chess board.

## Installation

Add this line to your application's Gemfile:

    gem 'knights-who-say-ni'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knights-who-say-ni

## Usage

    require 'knights_who_say_ni'
    KnightsWhoSayNi::FieldMarshal[2, 3].pairings.each do |pairing|
      white_pos = pairing[:white]
      black_pos = pairing[:black]
      puts "#{white_pos} - #{black_pos}"
    end

Or via commandline:

    $ ./bin/ni 2 3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

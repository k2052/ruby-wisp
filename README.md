# Ruby Wisp

Ruby bridge for [Wisp](https://github.com/Gozala/wisp) compiler

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-wisp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-wisp

## Usage

```ruby
require 'wisp'

Wisp.compile "(:foo bar)"
# => "(bar || 0)[\"foo\"]"

Wisp.compile File.new "app.wisp"
Wisp.compile File.read "app.wisp"
Wisp.compile File.open "app.wisp"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

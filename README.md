# Ruby Wisp

Ruby bridge for [wisp](https://github.com/Gozala/wisp) compiler. Integrates with Rails 4.0 and better.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-wisp', '~> 1.0.0.beta1', require: 'wisp'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ruby-wisp
```

## Usage

```ruby
require 'wisp'

Wisp.compile "(:foo bar)"
# => "(bar || 0)[\"foo\"]"

Wisp.compile File.open "app.wisp"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

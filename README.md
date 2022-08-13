[![test - Ruby 3.1](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/test_ruby_3.1.yml/badge.svg)](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/test_ruby_3.1.yml)
[![RuboCop - Ruby 3.1](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/rubocop_ruby_3.1.yml/badge.svg)](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/rubocop_ruby_3.1.yml)
[![test - Ruby 3.0](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/test_ruby_3.0.yml/badge.svg)](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/test_ruby_3.0.yml)
[![RuboCop - Ruby 3.0](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/rubocop_ruby_3.0.yml/badge.svg)](https://github.com/fugakkbn/config_rbs_generator/actions/workflows/rubocop_ruby_3.0.yml)

# config_rbs_generator

The `config_rbs_generator` generates an RBS for the `Settings` object that can be handled by the `config` gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'config_rbs_generator', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install config_rbs_generator

## Usage

Simply run the following command in the root directory of your Rails project.

    $ bundle exec config_rbs_generate

The RBS will then appear in the console. Place rbs file in the location of your choice and copy & paste.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

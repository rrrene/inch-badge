# Inch::Badge

Rubygem used to generate badges for Inch

## Installation

Add this line to your application's Gemfile:

    gem 'inch-badge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inch-badge

## Usage

### Shell

    $ inch-badge FILENAME U C B A

Example:

    $ inch-badge example.png 300 21 12 316

### Ruby

```ruby
Inch::Badge::Image.new("example.png", [300, 21, 12, 316]).save
```

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

    $ inch-badge FILENAME A B C U

Example:

    $ inch-badge example.png 300 21 12 316

### Ruby

Create a PNG badge:

```ruby
Inch::Badge::Image.create("example.png", [300, 21, 12, 316])
```

Create a SVG badge:

```ruby
Inch::Badge::Image.create("example.svg", [300, 21, 12, 316])
```

# Canonical::Middleware

Inserts a canonical url with a predefined host to prevent
search engines from crawling domains like `herokuapp.com`

## Setup

```
git clone git@github.com:renuo/canonical-header.git
cd canonical-header
bin/setup
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'canonical-header'
```

And then execute `bundle install`

## Usage

Update your application config file and set the `CANONICAL_HOST` env variable



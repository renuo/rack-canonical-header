# rack-canonical-header

Inserts a canonical url with a predefined host to prevent
search engines from crawling domains like `herokuapp.com`

## Setup

```
git clone git@github.com:renuo/rack-canonical-header.git
cd rack-canonical-header
bin/setup
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-canonical-header'
```

And then execute `bundle install`

## Usage

Set the `CANONICAL_HOST` env variable

### Non-Rails frameworks

If you're using a framework which uses Rack (like Hanami)
you have to require and insert the middleware
`Canonical::Middleware` manually into the rack stack.

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

Set the `CANONICAL_HOST` env variable to the desired host
(i.e. set it to the domain of your website like `CANONICAL_HOST=example.com`)

The gem will inject a header of the format
`Link: <http[s]://CANONICAL_HOST[/path]>; rel=canonical` as soon as the env is present.
The path and the scheme will be replaced
with what was requested on the original domain.

Note that the gem does *no* redirects.
Therefore, your non-canonical urls will still work if you access them directly.
However, search engines will not list them.

### Non-Rails frameworks

If you're using a framework which uses Rack (like Hanami)
you have to require and insert the middleware
`Canonical::Middleware` manually into the rack stack.

For example:

```ruby
require 'rack/auth/basic'
require 'rack-canonical-header'

module Web
  class Application < Hanami::Application
    configure do
      middleware.use Canonical::Middleware
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renuo/rack-canonical-header. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).

## Code of Conduct

Everyone interacting in the Rack Canonical Headers project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

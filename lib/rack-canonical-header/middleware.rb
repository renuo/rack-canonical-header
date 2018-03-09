module Canonical
  class Middleware
    def initialize(app)
      @app = app
      @status, @headers, @body = nil
    end

    def call(env)
      @status, @headers, @body = @app.call(env)
      canonical_host = ENV['CANONICAL_HOST']
      return [@status, @headers, @body] unless html? && canonical_host

      @headers['Link'] = Middleware.canonical_tag(env, canonical_host)

      [@status, @headers, @body]
    end

    def self.canonical_tag(env, canonical_host)
      canonical = "#{env['rack.url_scheme']}://#{canonical_host}#{env['REQUEST_URI']}"
      "<#{canonical}>; rel=\"canonical\""
    end

    def html?
      @headers['Content-Type'] =~ /html/
    end
  end
end

require 'rack-canonical-header/middleware'
require 'rack-canonical-header/version'
require 'rack-canonical-header/rails' if defined?(Rails) && ENV['CANONICAL_HOST'].present?

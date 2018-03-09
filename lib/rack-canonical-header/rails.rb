module Canonical
  class Railtie < Rails::Railtie
    initializer 'canonical.configure_rack_middleware' do |app|
      app.middleware.use Canonical::Middleware
    end
  end
end

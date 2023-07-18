require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TubuyakiApp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end

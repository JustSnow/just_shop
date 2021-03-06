require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

require 'admin_app/engine'

Bundler.require(*Rails.groups)

module JustShop
  class Application < Rails::Application
    config.time_zone = Settings.application.time_zone

    config.i18n.load_path += Dir['config/locales/**/*.{rb,yml}']
    config.i18n.available_locales = Settings.application.available_locales
    config.i18n.default_locale = Settings.application.default_locale

    config.generators do |g|
      g.helper false
      g.assets false
      g.decorator false

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.view_specs false
      g.helper_specs false
      g.view_specs false
      g.controller_spec true
      g.model_spec true
    end

    %w(uploaders forms presenters queries workers views/mailers).each do |folder_path|
      config.autoload_paths += Dir["#{ config.root }/app/#{folder_path}/**/"]
    end

    config.autoload_paths += Dir["#{ config.root }/lib/**/"]

    config.active_record.raise_in_transactional_callbacks = true

    ActionMailer::Base.prepend_view_path("#{ config.root }/app/views/mailers/")
  end
end

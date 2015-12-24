module AdminApp
  class Engine < ::Rails::Engine
    isolate_namespace AdminApp

    autoload_paths = %w(
      app/queries
      app/services
      app/forms
      app/policies
      api
      api/concerns
      api/helpers
    ).map{ |path| "#{config.root}/#{path}" }

    config.autoload_paths   += autoload_paths
    config.eager_load_paths += autoload_paths

    config.i18n.load_path += Dir['engines/admin_app/config/locales/**/*.{rb,yml}']

    initializer :asset_precompile_paths do |app|
      app.config.assets.precompile += %w(
        admin_app/admin.js
        admin_app/admin.css
        admin_app/authentification.js
        admin_app/authentification.css
      )
    end

    initializer :load_admin_app_settings do |app|
      Config.load_and_set_settings \
      "#{config.root}/config/settings.yml",
      config.root.join('config', 'settings', "#{Rails.env}.yml")
    end

    config.assets.paths << AdminApp::Engine.root.join('app', 'assets', 'fonts')
    config.assets.precompile << Proc.new do |path|
      path =~ /fontawesome\/fonts/ and File.extname(path).in?(['.otf', '.eot', '.svg', '.ttf', '.woff', '.woff2'])
    end
  end
end

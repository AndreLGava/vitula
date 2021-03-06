require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vitula
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}').to_s]
    #config.autoload_paths += %W(#{config.root}/lib)
    #config.autoload_paths += Dir["#{config.root}/lib/**/"]
    #config.autoload_paths += Dir[ Rails.root.join('app', 'models', "concerns", '**/') ]
    #config.autoload_paths += Dir[ Rails.root.join('app', 'controllers', "concerns", '**/') ]



    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => 'gmail.com',
      :user_name            => 'vitulasystem',
      :password             => 'unieduuniedu',
      :authentication       => 'plain',
      :enable_starttls_auto => true
    }
    config.action_mailer.raise_delivery_errors = true

    config.i18n.load_path += Dir[File.join(config.root, 'config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"
    Date::DATE_FORMATS[:default] = "%d/%m/%Y"


    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

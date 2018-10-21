require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LearnZone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Custom environment files
    if Rails.env.development? 
      config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        if File.exists?(env_file)
          YAML.load(File.open(env_file)).each do |key, value|
            ENV[key.to_s] = value
          end 
        end
      end
    end

    # BAD?
    # http://brettu.com/rails-ruby-tips-203-load-lib-files-in-rails-4/
    # config.autoload_paths += %W(#{config.root}/lib)
    # https://blog.bigbinary.com/2016/08/29/rails-5-disables-autoloading-after-booting-the-app-in-production.html
    config.eager_load_paths << Rails.root.join('lib')

  end
end
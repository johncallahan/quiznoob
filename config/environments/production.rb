Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  #config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  #
  # Use lograge formatting
  #
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  #
  # logstash-logger w/UDP
  #
  # Optional, Rails sets the default to :info
  config.log_level = :info
  # Optional, Rails 4 defaults to true in development and false in production
  #config.autoflush_log = true
  # Optional, use a URI to configure. Useful on Heroku
  #config.logstash.uri = ENV['LOGSTASH_URI']
  # Optional. Defaults to :json_lines. If there are multiple outputs,
  # they will all share the same formatter.
  #config.logstash.formatter = :json_lines
  # Optional, max number of items to buffer before flushing. Defaults to 50
  #config.logstash.buffer_max_items = 50
  # Optional, max number of seconds to wait between flushes. Defaults to 5
  #config.logstash.buffer_max_interval = 5

  # Optional, defaults to '0.0.0.0'
  config.logstash.host = ENV['LOGSTASH_HOST']
  # Optional, defaults to :udp.
  config.logstash.type = :udp
  # Required, the port to connect to (should be 5228)
  config.logstash.port = ENV['LOGSTASH_PORT']

  LogStashLogger.configure do |config|
    config.customize_event do |event|
      event["app"] = ENV['APP_NAME']
      event["remote_ip"] = RequestStore.store[:remote_ip]
      event["user_agent"] = RequestStore.store[:user_agent]
      event["user_id"] = RequestStore.store[:user_id]
    end
  end

end

source 'https://rubygems.org'

gem 'github-pages', group: :jekyll_plugins
gem "jekyll-readme-index", group: :jekyll_plugins
gem 'jemoji', group: :jekyll_plugins

gem 'ancestry'
gem 'kaminari'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '= 4.2.10'
# Use mysql as the database for Active Record
gem 'pg', '0.17.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'roo'

gem 'pkg-config'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap-sass', '~> 3.3.6'

gem 'rack-cors', :require => 'rack/cors'

gem 'rest-client'

#gem 'devise', '~> 3.4.0'
gem 'devise'
gem 'time_difference'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :production do
#  gem 'rails_12factor', '0.0.2'
  gem 'mysql'
  gem 'rails_serve_static_assets'
  gem 'logstash-logger'
  gem 'lograge'
  gem 'logstash-event'
  gem 'request_store'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

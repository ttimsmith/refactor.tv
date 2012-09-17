source 'https://rubygems.org'

# The latest version of Ruby
ruby '1.9.3'

# The lastest version of Rails
gem 'rails', '3.2.7'

# Postgres
gem 'pg'

# EventMachine-based web server
gem 'thin'

# Markdown
gem 'redcarpet', require: false

group :assets do
  # Stylesheet
  gem 'sass', '~> 3.2.0.alpha.278'
  gem 'sass-rails'
  gem 'bourbon'

  # Javascript
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'jquery-rails'

  # Distribution
  gem 'asset_sync'
end

# Only used in development
group :development do
  # Heroku deployment
  gem 'heroku', require: false

  # Hide asset requests from developmenet logs
  gem 'quiet_assets'
end

# Only used in production
group :production do
  # Memcache client. Used for various caching
  gem 'dalli'
end

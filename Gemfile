source 'https://rubygems.org'

# The latest version of Ruby
ruby '2.0.0'

# Rails
gem 'rails', '3.2.11'

# Postgres
gem 'pg'

# Web server
gem 'puma'

# Markdown
gem 'redcarpet', '~> 2.1', require: false

group :assets do
  # Stylesheet
  gem 'sass'
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
  # Hide asset requests from developmenet logs
  gem 'quiet_assets'
end

# Only used in production
group :production do
  # Memcache client. Used for various caching
  gem 'dalli'
end

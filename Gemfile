source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Adhearsion and it's dependencies
gem "adhearsion", "~> 2.1.3"
gem "adhearsion-asterisk"
gem "punchblock", ">= 1.4.1"

gem "slim-rails"
gem "bootstrap-sass"
gem "inherited_resources"

gem "will_paginate", "3.0.3"
gem "bootstrap-will_paginate"

#gem "activerecord-wrap-with-connection"

platforms :ruby do
  gem 'mysql2'
end

platforms :jruby do
  gem 'activerecord-jdbcmysql-adapter'
  gem 'ffi'
end

gem 'easy_roles'
gem 'time_diff'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'annotate', '~> 2.4.1.beta'
  gem 'nifty-generators'
  gem 'rails_refactor', :require => false
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#gem "mocha", :group => :test, :require => false

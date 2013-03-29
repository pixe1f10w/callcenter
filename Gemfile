source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem "adhearsion", ">= 2.2.0"
gem "adhearsion-asterisk"

gem "slim-rails"
gem "bootstrap-sass"
gem "inherited_resources"

gem "will_paginate", "3.0.3"
gem "bootstrap-will_paginate"

#gem 'easy_roles'
gem 'time_diff'

gem 'sequel'
gem 'talentbox-sequel-rails'

=begin
# suggestions for future milestones
gem 'active-admin'
  #gem 'meta_search', '>=1.1.0.pre'
gem 'adhearsion-twilio'
gem 'flatui-rails'
gem 'devise'
gem 'soundmanager-rails'
=end

platforms :ruby do
  gem 'mysql2'
  gem 'pg'
  gem 'therubyracer'
end

platforms :jruby do
  gem 'jdbc-mysql'
  gem 'ffi'
  gem 'jruby_sandbox'
  gem 'therubyrhino'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'codemirror-rails'
  gem 'jquery-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'annotate', '~> 2.4.1.beta' # seems to be incompatible with sequel
  gem 'better_errors'
  gem 'meta_request'
  gem 'sextant'
  gem 'quiet_assets'
  gem 'nifty-generators'
  gem 'rails_refactor', :require => false # seems to be broken
  gem 'debugger'

  platforms :ruby do
    gem 'zeus'
    gem 'binding_of_caller'
  end
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'

#gem "mocha", :group => :test, :require => false

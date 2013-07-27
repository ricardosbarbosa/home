source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'mysql2'

group :production do
  gem "pg"
end

group :development, :test do
  gem "sqlite3"
end

gem 'devise'
gem "declarative_authorization"
gem 'twitter-bootstrap-rails'#, :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem "rghost", ">=0.8.7.6"
gem "rghost_barcode"
gem "parseline"
gem "brcobranca", :git => "git://github.com/kivanio/brcobranca.git", :branch => "master"
gem 'simple-private-messages', '0.0.0', :git => 'git://github.com/jongilbraith/simple-private-messages.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'libv8', '~> 3.11.8'
  gem "less-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'#, :platforms => :ruby

  gem "paperclip", :git => "http://github.com/thoughtbot/paperclip.git"
  gem 'uglifier', '>= 1.0.3'
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

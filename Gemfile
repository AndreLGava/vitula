source 'https://rubygems.org'


gem 'rails_12factor', group: :production
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use postgre as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# validates with jquery validate
gem "jquery-validation-rails"

# Dual list (select) bootstrap based
gem 'bootstrap-duallistbox-rails', '~> 3.0', '>= 3.0.2'

# Jquery mask
gem 'jquery-mask-plugin', '~> 0.1.0'

# customizable alert js
gem 'alertifyjs-rails'

# datepicker bootstrap
gem 'bootstrap-datepicker-rails'
# gem 'momentjs-rails', '>= 2.9.0'
# gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'

# A lot interface components
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs# readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Filterable selects
gem 'select2-rails', '~> 4.0', '>= 4.0.2'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# User management
gem 'devise'

# authorization
gem 'cancan', '~> 1.6', '>= 1.6.10'

# register everithig that users do
gem 'paper_trail', '~> 5.1', '>= 5.1.1'

# I18n + Better interface for bootstrap views
gem 'devise-bootstrap-views'

# Breadcrumbs
gem "gretel"

# Icons
gem 'font-awesome-rails'

# Form helper
gem 'simple_form'

# Grid filter sort pagination by js
gem 'jquery-datatables-rails'

# pagination
gem 'kaminari'

# i18n for enums
gem 'enum_help'

# Send files
gem 'paperclip', '~> 4.3', '>= 4.3.6'

# manipulate image files
gem 'papercrop', '~> 0.3.0'

# show data organized into terminal
gem 'awesome_print', :require => 'ap'

# charts
gem 'highcharts-rails', '~> 4.2', '>= 4.2.5'

#contador de tempo
gem 'dotiw'

#gerador de templates bootstrap
gem 'bootstrap-generators', '~> 3.3.4'

#Jobs
gem 'sidekiq'

#export PDF
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

#export XLS
gem 'axlsx', '~> 2.0'
gem "axlsx_rails"


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Specs instead of unit test
  gem 'rspec-rails'

  # Object helper for testing purpose
  gem 'factory_girl_rails'

  # Clean test db
  gem 'database_cleaner'

  # Matchers for specs
  gem 'shoulda-matchers'
end

group :quality do
  # security
  gem 'brakeman', '~> 3.3', '>= 3.3.1'

  # code quality and style
  gem 'rubocop', '~> 0.40.0'

  # report of quality and complexity
  gem 'rubycritic', '~> 2.9', '>= 2.9.1'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Console on browser at raise
  gem 'better_errors'

  # Return and debug errors
  gem 'pry'

end

ruby "2.3.1"
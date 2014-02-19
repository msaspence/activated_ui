require 'coveralls'
Coveralls.wear!
require 'rubygems'
require 'spork'
require 'rails/all'

#uncomment the following line to use spork with the debugger
# require 'spork/ext/ruby-debug'

Spork.prefork do

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  require 'rspec/autorun'

  RSpec.configure do |config|

    RESERVED_IVARS = %w(@loaded_fixtures)

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    config.treat_symbols_as_metadata_keys_with_true_values = true

  end

  ActiveSupport::Dependencies.clear

end

Spork.each_run do

  load File.dirname(__FILE__) + "/../lib/activated_ui.rb"

end


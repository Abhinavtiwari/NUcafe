# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NUcafe::Application.initialize!

#Initialize Logger
#Rails.logger = Logger.new(STDOUT)
#Rails.logger = Log4r::Logger.new("Application Log")
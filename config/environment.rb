# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Task::Application.initialize!

ActionMailer::Base.register_template_extension('haml')

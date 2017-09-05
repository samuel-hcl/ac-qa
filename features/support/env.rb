require 'active_support/all'
require 'capybara'
require 'capybara/cucumber'
require 'capybara-ng'
require 'rspec/expectations'
require 'pry'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'http://qa-test.avenuecode.com'
end

Capybara.default_max_wait_time = 5

World(Capybara)

Before do
  visit '/'
end

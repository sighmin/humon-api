ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

if ENV.fetch("COVERAGE", false)
  require "simplecov"
  SimpleCov.start "rails"
end

require "rspec/rails"
require "shoulda/matchers"
require "webmock/rspec"
require "factory_girl"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "tmp/rspec_examples.txt"
  config.order = :random

  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end

WebMock.disable_net_connect!(allow_localhost: true)
ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit


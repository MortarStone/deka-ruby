require 'simplecov'
SimpleCov.start
require 'factory_bot'
require "bundler/setup"
require "deka"
require 'vcr'
require 'pry'
require 'dotenv/load'

Dir[File.join(File.dirname(__FILE__), "/support/**/*.rb")].sort.each { |f| require f }

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock, :faraday
  config.default_cassette_options = { record: :once }
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

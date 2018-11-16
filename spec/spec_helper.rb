# frozen_string_literal: true

require "bundler/setup"

require 'coveralls'
Coveralls.wear!

require "dotenv/load"
require "rspec"
require "vcr"
require "onyphe"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.filter_sensitive_data("<API_KEY>") { ENV["ONYPHE_API_KEY"] }
end

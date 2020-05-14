require "bundler/setup"
require "open_invoice"
require "dotenv"
require 'factory_bot'
require "byebug"

Dotenv.load(".env.test")

OpenInvoice.configure do |configs|
  configs.verbose    = true
  configs.base_uri   = ENV["OPEN_INVOICE_BASE_URI"]
  configs.api_token  = ENV["OPEN_INVOICE_API_TOKEN"]
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

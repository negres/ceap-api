require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
require 'shoulda-matchers'
require 'sidekiq/testing'
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

Sidekiq::Testing.fake!
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.before(:suite) do
    config.add_setting :customer_api_key
    config.add_setting :bio_api_key

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, except: %w[customers])
  end

  config.include FactoryBot::Syntax::Methods

  config.include ActiveSupport::Testing::TimeHelpers

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

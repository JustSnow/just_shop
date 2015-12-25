ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'pundit/rspec'
require 'webmock/rspec'

ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect! allow_localhost: true

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.failure_color = :magenta
  config.tty = true
  config.color = true

  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  # Sidekiq::Testing.inline!

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.start
    # Sidekiq::Worker.clear_all
    ActionMailer::Base.deliveries.clear
  end

  config.after :each do
    DatabaseCleaner.clean
    # TODO add shared admin
    # FactoryGirl.reset_shared_admin
  end

  # config.after(:all) do
  #   FileUtils.rm_rf(Dir["#{ Rails.root }/public/uploads/imports/test/[^.]*"])
  # end
end

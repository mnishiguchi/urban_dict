# frozen_string_literal: true

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
  # config.default_cassette_options = { record: :new_episodes }
end

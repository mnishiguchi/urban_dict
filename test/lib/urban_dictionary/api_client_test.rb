# frozen_string_literal: true

require "test_helper"

class UrbanDictionary::ApiClientTest < ActiveSupport::TestCase
  test "fetch_definitions_for_term" do
    VCR.use_cassette("lib/urban_dictionary/api_client_test") do
      data = UrbanDictionary::ApiClient.fetch_definitions_for_term("wip")

      assert data.is_a?(Array)
      assert data.first.is_a?(Hash)
    end
  end
end

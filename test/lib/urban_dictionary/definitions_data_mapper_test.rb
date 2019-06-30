# frozen_string_literal: true

require "test_helper"

class UrbanDictionary::DefinitionsDataMapperTest < ActiveSupport::TestCase
  test "fetch_definitions_for_term" do
    result = UrbanDictionary::DefinitionsDataMapper.call(data_from_api)

    expected = [{
      "definition" => "[Work] In [Progress]",
      "word" => "wip",
      "example" => "[The model] I've [made] is [still] a wip!",
      "created_at" => "2003-08-26T00:00:00.000Z",
      "updated_at" => "2003-08-26T00:00:00.000Z"
    }]
    assert_equal expected, result.as_json
  end

  def data_from_api
    [{ "definition" => "[Work] In [Progress]",
       "permalink" => "http://wip.urbanup.com/227998",
       "thumbs_up" => 1058,
       "sound_urls" => [],
       "author" => "Dave",
       "word" => "wip",
       "defid" => 227_998,
       "current_vote" => "",
       "written_on" => "2003-08-26T00:00:00.000Z",
       "example" => "[The model] I've [made] is [still] a wip!",
       "thumbs_down" => 140 }]
  end
end

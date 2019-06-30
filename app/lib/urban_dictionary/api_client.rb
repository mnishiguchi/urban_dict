# frozen_string_literal: true

module UrbanDictionary
  class ApiClient
    def self.fetch_definitions_for_term(term)
      conn = Faraday.new(url: "http://api.urbandictionary.com")
      response = conn.get("/v0/define", term: term)
      parsed_body = JSON.parse(response.body)
      parsed_body.fetch("list")
    end
  end
end

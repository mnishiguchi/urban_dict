require 'fileutils'

namespace :urban_dictionary do
  desc "Fetches definitions for a term [:term]"
  task :definitions, [:term] => :environment do |_t, args|
    term = args.term || fail("A term must be provided as a param")

    definition_hashes = UrbanDictionary::DefinitionsDataMapper.call(
      UrbanDictionary::ApiClient.fetch_definitions_for_term(term)
    )
    dest_dir = Rails.root.join("tmp", "urban_dictionary")
    FileUtils.mkdir_p(dest_dir)
    dest_file = dest_dir + "#{term}.json"
    IO.write(dest_file, definition_hashes.to_json)
    puts "Definitions for #{term} are saved to #{dest_file}"
  end
end

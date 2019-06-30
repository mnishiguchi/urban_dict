# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DefinitionVote.delete_all
DefinitionTag.delete_all
Tag.delete_all
Definition.delete_all
User.delete_all

# users
users = User.create!(
  [
    { username: "mnishiguchi", email: "mnishiguchi@example.com" },
    { username: "jhendrix", email: "jhendrix@example.com" },
    { username: "sigi", email: "sigi@example.com" }
  ]
)

# definitions
json_files = Dir.glob(Rails.root.join("db", "seeds", "urban_dictionary", "**", "*.json"))
json_files.each do |json_file|
  users.sample.definitions.create!(JSON.parse(IO.read(json_file)))
end

# votes
user_ids = User.ids
Definition.ids.take(10).each do |definition_id|
  DefinitionVoteUp.create!(user_id: user_ids.sample, definition_id: definition_id)
end

# tags
tags = %w[business tech general].map { |tag_name| Tag.create!(name: tag_name) }
Definition.ids.take(10).each do |definition_id|
  DefinitionTag.create!(tag: tags.sample, definition_id: definition_id)
end

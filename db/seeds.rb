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
_admin = User.create!(
  email: "admin@example.com", password: "password", confirmed_at: Time.current, admin: true
)
users = User.create!(
  [{ email: "user@example.com", password: "password", confirmed_at: Time.current },
   { email: "mnishiguchi@example.com", password: "password", confirmed_at: Time.current },
   { email: "jhendrix@example.com", password: "password", confirmed_at: Time.current },
   { email: "sigi@example.com", password: "password", confirmed_at: Time.current }]
)

# definitions
json_files = Dir.glob(Rails.root.join("db", "seeds", "urban_dictionary", "**", "*.json"))
json_files.each do |json_file|
  users.sample.definitions.create!(JSON.parse(IO.read(json_file)))
end

# votes
Definition.all.shuffle.take(10).each do |definition|
  DefinitionVoteUp.vote(user: users.sample, definition: definition)
end

# tags
tag_names = %w[business tech general]
Definition.all.shuffle.take(10).each do |definition|
  definition.update(tag_names: tag_names.sample)
  DefinitionTag.update_with_definition(definition)
end

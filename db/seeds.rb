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
Word.delete_all
User.delete_all

masa = User.create!(username: "mnishiguchi", email: "mnishiguchi@example.com")
jimi = User.create!(username: "jhendrix", email: "jhendrix@example.com")

word = masa.words.create!(name: "WIP")

masa.definitions.create!(word: word, definition: "Work in Progress")
jimi.definitions.create!(word: word, definition: "What is popped?")

Definition.last.definition_vote_ups.create!(user: masa)
Definition.first.definition_vote_downs.create!(user: jimi)

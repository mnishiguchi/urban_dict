# frozen_string_literal: true

require "administrate/base_dashboard"

class DefinitionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    definition_vote_ups: Field::HasMany,
    definition_vote_downs: Field::HasMany,
    definition_tags: Field::HasMany,
    id: Field::Number,
    word: Field::String,
    definition: Field::Text,
    example: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    definition_vote_ups_count: Field::Number,
    definition_vote_downs_count: Field::Number,
    score: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    definition_vote_ups
    definition_vote_downs
    definition_tags
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    definition_vote_ups
    definition_vote_downs
    definition_tags
    id
    word
    definition
    example
    created_at
    updated_at
    definition_vote_ups_count
    definition_vote_downs_count
    score
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    definition_vote_ups
    definition_vote_downs
    definition_tags
    word
    definition
    example
    definition_vote_ups_count
    definition_vote_downs_count
    score
  ].freeze

  # Overwrite this method to customize how definitions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(definition)
  #   "Definition ##{definition.id}"
  # end
end

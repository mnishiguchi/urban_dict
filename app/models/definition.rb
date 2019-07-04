# frozen_string_literal: true

# == Schema Information
#
# Table name: definitions
#
#  id                          :bigint           not null, primary key
#  word                        :string           not null
#  definition                  :text             not null
#  example                     :text
#  user_id                     :bigint
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  definition_vote_ups_count   :integer          default(0), not null
#  definition_vote_downs_count :integer          default(0), not null
#  score                       :integer          default(0), not null
#

class Definition < ApplicationRecord
  include PgSearch

  strip_attributes

  belongs_to :user, optional: true
  has_many :definition_vote_ups, dependent: :destroy
  has_many :definition_vote_downs, dependent: :destroy
  has_many :definition_tags, dependent: :destroy

  validates :word, presence: true
  validates :definition, presence: true

  before_save -> { self.word = word.titleize }

  alias_attribute :author, :user

  pg_search_scope :fuzzy_match_by_word, against: :word, using: { trigram: { threshold: 0.6 } }

  class << self
    def top_definitions
      find_by_sql <<~SQL.squish
        SELECT DISTINCT ON (word) *
        FROM definitions
        ORDER BY word, score DESC ;
      SQL
    end
  end

  def tags=(_)
    raise "Please use a service object to create tags"
  end

  def tags
    Tag.where(id: tag_ids).pluck(:name)
  end

  def tag_ids
    DefinitionTag.where(definition: self).pluck(:tag_id)
  end

  def slug
    "#{word.underscore.dasherize}-#{id}" if persisted?
  end

  def author_name
    author.username.presence || "Unknown author"
  end
end

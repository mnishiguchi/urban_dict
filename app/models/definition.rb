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
  scope :with_tag, ->(tag) { where(id: DefinitionTag.where(tag: tag).pluck(:definition_id)) }
  scope :with_tag_name, ->(tag_name) { with_tag(Tag.where(name: tag_name)) }

  class << self
    def top_definitions(word = nil)
      if word.blank?
        find_by_sql(<<~SQL.squish)
          SELECT DISTINCT ON (word) *
          FROM definitions
          ORDER BY word, score DESC ;
        SQL
      else
        find_by_sql([<<~SQL.squish, "%#{word}%"])
          SELECT DISTINCT ON (word) *
          FROM definitions
          WHERE word ILIKE ?
          ORDER BY word, score DESC ;
        SQL
      end
    end
  end

  def tags
    Tag.where(id: tag_ids)
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

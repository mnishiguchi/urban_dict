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
#  tag_names                   :string
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

  before_save :standardize_on_word_format

  alias_attribute :author, :user

  pg_search_scope :fuzzy_match_by_word, against: :word, using: { trigram: { threshold: 0.6 } }
  scope :with_tag, ->(tag) { where(id: DefinitionTag.where(tag: tag).pluck(:definition_id)) }
  scope :with_tag_name, ->(tag_name) { with_tag(Tag.where(name: tag_name)) }

  class << self
    def distinct_on_word
      find_by_sql(<<~SQL.squish)
        SELECT DISTINCT ON (word)
         *
        FROM definitions
        ORDER BY word ;
      SQL
    end

    def authors
      User.where(id: author_ids)
    end

    # Sorted by contribution count desc.
    def author_ids
      author_contribution_hash.keys
    end

    def author_contribution_hash
      Definition.group(:user_id).order(count_id: :desc).count(:id)
    end

    # Unique words in alphabetical order
    def words
      distinct(:word).order(:word).pluck(:word).uniq(&:downcase)
    end

    # Unique words grouped by alphabet
    def words_grouped_by_alphabet
      # https://stackoverflow.com/a/4410192/3837223
      words.each_with_object(Hash.new { |h, k| h[k] = [] }) do |word, obj|
        initial = word.first.downcase
        obj[initial] << word
      end
    end

    def ids_sorted_by_score
      select(:id, :definition_vote_ups_count, :definition_vote_downs_count).
        sort_by(&:score).reverse!.map(&:id)
    end
  end

  def score
    definition_vote_ups_count - definition_vote_downs_count
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

  private

  def standardize_on_word_format
    self.word = word.titleize
  end
end

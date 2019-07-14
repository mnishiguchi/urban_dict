# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  strip_attributes

  has_many :definition_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }

  before_save :standardize_on_name_format

  alias_attribute :author, :user

  class << self
    def from_tag_names(tag_names)
      tag_names.compact.uniq.map { |tag_name| Tag.find_or_create_by(name: tag_name.titleize) }
    end
  end

  private

  def standardize_on_name_format
    self.name = name.titleize
  end
end

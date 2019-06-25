# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  strip_attributes

  has_many :words, dependent: :nullify
  has_many :definitions, dependent: :nullify
  has_many :definition_vote_ups, dependent: :destroy
  has_many :definition_vote_downs, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true
end

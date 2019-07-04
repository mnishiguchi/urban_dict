# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string           default(""), not null
#  admin                  :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  strip_attributes

  has_many :definitions, dependent: :nullify
  has_many :definition_vote_ups, dependent: :destroy
  has_many :definition_vote_downs, dependent: :destroy

  before_validation :assign_username

  validates :username, presence: true
  validates :email, presence: true

  def upvotes
    @upvotes ||= definition_vote_ups.pluck(:definition_id)
  end

  def downvotes
    @downvotes ||= definition_vote_downs.pluck(:definition_id)
  end

  private

  def assign_username
    self.username ||= email.to_s.partition("@").first
  end
end

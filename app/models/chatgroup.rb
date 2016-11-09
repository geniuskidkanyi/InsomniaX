class Chatgroup < ApplicationRecord
  has_many :chatgroup_users
  has_many :users, through: :chatgroup_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, :presence => true
  validates :description, :presence => true
  extend FriendlyId
  friendly_id :name, use: :slugged
end

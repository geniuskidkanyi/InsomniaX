class Chatgroup < ApplicationRecord
  has_many :chatgroup_users
  has_many :users, through: :chatgroup_users
  has_many :messages
  validates :name, :presence => true
  validates :description, :presence => true
end

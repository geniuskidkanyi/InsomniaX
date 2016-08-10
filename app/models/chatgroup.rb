class Chatgroup < ApplicationRecord
  has_many :chatgroup_users
  has_many :users, through: :chatgroup_users
  has_many :messages
end

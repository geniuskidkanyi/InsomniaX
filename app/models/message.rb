class Message < ApplicationRecord
  belongs_to :chatgroup
  belongs_to :user
  validates :body, :presence => true
end

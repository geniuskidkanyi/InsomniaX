class Message < ApplicationRecord
  belongs_to :chatgroup, dependent: :destroy
  belongs_to :user
  validates :body, :presence => true



end

class Forumthred < ApplicationRecord
  belongs_to :forum
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 5000 }
end

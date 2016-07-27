class Forum < ApplicationRecord
  has_many :forumthred
  validates :title, presence: true, length: { maximum: 100 }
  validates :position, presence: true, length: { maximum: 100 }
end

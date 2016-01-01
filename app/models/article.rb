class Article < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    is_impressionable
    acts_as_commentable
    belongs_to :user
    has_many :comments
    acts_as_taggable
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true


end

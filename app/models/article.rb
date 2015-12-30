class Article < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    acts_as_taggable
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true
end

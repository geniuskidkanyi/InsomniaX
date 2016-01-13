class Article < ActiveRecord::Base
    acts_as_commentable
    extend FriendlyId
    friendly_id :title, use: :slugged
    is_impressionable
<<<<<<< HEAD

=======
    mount_uploader :picture_article, PictureArticleUploader
    acts_as_commentable
>>>>>>> blog
    belongs_to :user
    has_many :comments
    acts_as_taggable
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true


end

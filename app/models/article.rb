class Article < ActiveRecord::Base

     acts_as_commentable
    validates_uniqueness_of :title
    extend FriendlyId
    friendly_id :title, use: :slugged
    is_impressionable
    mount_uploader :picture_article, PictureArticleUploader
    acts_as_commentable
    #belongs_to :user
    has_many :comments
    acts_as_taggable
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true


    default_scope { order('created_at DESC') }



end

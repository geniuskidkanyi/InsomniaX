class Article < ActiveRecord::Base
    after_save :load_into_soulmate
	before_destroy :remove_from_soulmate

    validates_uniqueness_of :title
    
    acts_as_commentable
    extend FriendlyId
    friendly_id :title, use: :slugged
    is_impressionable
    mount_uploader :picture_article, PictureArticleUploader
    acts_as_commentable
    belongs_to :user
    has_many :comments
    acts_as_taggable
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true

    
    

	def load_into_soulmate
        loader = Soulmate::Loader.new("articles")
        loader.add("term" => title, "id" => self.id, "data" => {
            "link" => Rails.application.routes.url_helpers.article_path(self)
	   	})
	end

	def remove_from_soulmate
        loader = Soulmate::Loader.new("articles")
	    loader.remove("id" => self.id)
	end

end

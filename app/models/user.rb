class User < ActiveRecord::Base
  has_merit

   
    acts_as_voter
    has_many :microposts, dependent: :destroy
    has_many :articles
    has_many :comments, dependent: :destroy
    acts_as_messageable
    has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
  mount_uploader :avatar, AvatarUploader

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save { self.email = email.downcase }

  after_save :load_into_soulmate
  before_destroy :remove_from_soulmate

  validates_uniqueness_of :name
  before_create :create_activation_digest

  validates :name, presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def User.new_token
    SecureRandom.urlsafe_base64
  end
    def mailboxer_email(object)
        email
    end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
digest = send("#{attribute}_digest")
return false if digest.nil?
BCrypt::Password.new(digest).is_password?(token)
end
    # forem user classes
  def forem_name
    name
  end
  def forem_email
    email
  end
    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end
    # Defines a proto-feed.
    # See "Following users" for the full implementation.

     def feed
      following_ids = "SELECT followed_id FROM relationships
WHERE follower_id = :user_id"
      Micropost.where("user_id IN (#{following_ids})
OR user_id = :user_id", user_id: id)
     end

    # Follows a user.
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end
    # Unfollows a user.
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end
    # Returns true if the current user is following the other user.
    def following?(other_user)
        following.include?(other_user)
    end
    
    # Activates an account.
  def activate
   update_attribute(:activated,
   true)
   update_attribute(:activated_at, Time.zone.now)
  end
    # Sends activation email.
  def send_activation_email
   UserMailer.account_activation(self).deliver_now
  end
    
    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest, User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
   end
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
    # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
   end
    private
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end


    
    def load_into_soulmate
        loader = Soulmate::Loader.new("Users")
		loader.add("term" => name, "id" => self.id, "data" => {
            "link" => Rails.application.routes.url_helpers.user_path(self)
	   	})
	end

	def remove_from_soulmate
        loader = Soulmate::Loader.new("Users")
	    loader.remove("id" => self.id)
	end


end


class User < ActiveRecord::Base
  has_many :chatgroup_users
  has_many :chatgroups, through: :chatgroup_users
  has_many :messages
  has_many :forum_threads
  has_many :forum_posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,  :lockable

    before_save { self.email = email.downcase }

    acts_as_voter
    mount_uploader :avatar, AvatarUploader
    mount_uploader :dprofile, ProfileCoverUploader
    has_many :notifications, foreign_key: :recipient_id
    has_many :microposts, dependent: :destroy
    has_many :articles
    has_many :comments, dependent: :destroy
    has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    include PublicActivity::Model
    #tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }

    default_scope { order('created_at DESC') }

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





end

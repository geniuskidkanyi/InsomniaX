class User < ActiveRecord::Base
  has_many :chatgroup_users
  has_many :chatgroups, through: :chatgroup_users
  has_many :messages
  has_many :hearts, dependent: :destroy
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

    def heart!(micropost)
      self.hearts.create!(micropost_id: micropost.id)
    end

    # destroys a heart with matching micropost_id and user_id
    def unheart!(micropost)
      heart = self.hearts.find_by_micropost_id(micropost.id)
      heart.destroy!
    end

    # returns true of false if a micropost is hearted by user
    def heart?(micropost)
      self.hearts.find_by_micropost_id(micropost.id)
    end



end

class Chatgroup < ApplicationRecord
  has_many :chatgroup_users
  has_many :users, through: :chatgroup_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, :presence => true
  validates :description, :presence => true
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_ids = users.map(&:name).sort
    name = "DM:#{user_ids.join(":")}"

    if chatgroup = direct_messages.where(name: name).first
      chatroup
    else
      # create a new chatgroup
      chatroup = new(name: name, direct_message: true)
      chatroup.users = users
      chatroup.save
      chatroup
    end
  end
end

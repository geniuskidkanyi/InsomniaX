# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    #grant_on 'comments#create',  badge: 'Engraved Glass', to: :user do |comment|

    #end
    grant_on 'messages#create', badge: 'Engraved Glass', to: :recipients, model_name: "User" do |message|
        message.recipients.messages.count >= 10
    end
    #grant_on 'messages#create',  badge: 'Engraved Glass', to: :user do |message|
    #    message.user.messages.count >= 50
    #end
    #grant_on 'messages#create',  badge: 'Golf', to: :user do |message|
    #    message.user.messages.count >= 100
    #end
    grant_on 'comments#create',  badge: 'Stopwatch', to: :user do |comment|
        comment.user.comments.count >= 10
    end
    grant_on 'comments#create',  badge: 'Mike Sticker', to: :user do |comment|
        comment.user.comments.count >= 50
    end
    grant_on 'comments#create',  badge: 'Fox', to: :user do |comment|
        comment.user.comments.count >= 100
    end
    grant_on 'comments#create',  badge: 'Golden Golbet', to: :user do |comment|
        comment.user.comments.count >= 200
    end
    grant_on 'microposts#create',  badge: 'Diamond Ring', to: :user do |micropost|
        micropost.user.microposts.count >= 50
    end
    grant_on 'microposts#create',  badge: 'Crystal', to: :user do |micropost|
          micropost.user.microposts.count >= 100
    end
    grant_on 'microposts#create',  badge: 'Gold Glove', to: :user do |micropost|
          micropost.user.microposts.count >= 200
    end

    end
  end
end

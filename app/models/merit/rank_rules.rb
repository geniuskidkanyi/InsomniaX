# Be sure to restart your server when you modify this file.
#
# 5 stars is a common ranking use case. They are not given at specified
# actions like badges, you should define a cron job to test if ranks are to be
# granted.
#
# +set_rank+ accepts:
# * :+level+ ranking level (greater is better)
# * :+to+ model or scope to check if new rankings apply
# * :+level_name+ attribute name (default is empty and results in 'level'
#   attribute, if set it's appended like 'level_#{level_name}')

module Merit
  class RankRules
    include Merit::RankRulesMethods

    def initialize
      # set_rank :level => 1, :to => Commiter.active do |commiter|
      #   commiter.repositories.count > 1 && commiter.followers >= 10
      # end
      #
      # set_rank :level => 2, :to => Commiter.active do |commiter|
      #   commiter.branches.count > 1 && commiter.followers >= 10
      # end
      #
      # set_rank :level => 3, :to => Commiter.active do |commiter|
      #   commiter.branches.count > 2 && commiter.followers >= 20
      # end

        set_rank level: 1, to: User.active do |user|
            user.comments > 10 && user.followers >= 10 && user.micropost >= 20
        end

        set_rank level: 2, to: User.active do |user|
            user.comments > 20 && user.followers >= 20
        end

        set_rank level: 3, to: User.active do |user|
            user.comments > 30 && user.followers >= 30
        end

        set_rank level: 4, to: User.active do |user|
            user.comments > 40 && user.followers >= 40
        end
    end
  end
end

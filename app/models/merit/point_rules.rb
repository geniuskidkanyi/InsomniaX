# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      #score 10, :on => 'users#create' do |user|
        # user.name.present?
      # end
      #
      # score 15, :on => 'reviews#create', :to => [:reviewer, :reviewed]
      #
       score 2, :on => [
         'comments#create',
         'microposts#create',
          'users#update',
          'sessions#create',
          'relationships#create',
          'users#create',
          'message#create'


       ]

       score -2, :on => [
         'comments#destroy',
         'microposts#destroy',
          'users#destroy',
          'sessions#destroy',
          'relationships#destroy',
          'users#destroy',


       ]
      #
      # score -10, :on => 'comments#destroy'


    end
  end
end

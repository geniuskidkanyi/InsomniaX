class PagesController < ApplicationController
    def index
        if logged_in?
            @micropost = current_user.microposts.build
         @activities = PublicActivity::Activity.order("created_at desc").limit(20)
        end
    end
end

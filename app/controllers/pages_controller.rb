class PagesController < ApplicationController
    def index
        if logged_in?
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page])
         @activities = PublicActivity::Activity.order("created_at desc").limit(20)
        end
    end
end

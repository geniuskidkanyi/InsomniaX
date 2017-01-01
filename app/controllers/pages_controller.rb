class PagesController < ApplicationController
    def home
        if user_signed_in?
            @micropost = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page],  :per_page => 30)
            respond_to do |format|
               format.html
               format.js
            end
        end
    end

    def leaderboard
        @leaderboard = Merit::Score.top_scored
    end
end

class PagesController < ApplicationController
    def index
        if logged_in?
            
         @activities = PublicActivity::Activity.order("created_at desc")
        end
    end
end

class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,
    only: :destroy
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'pages/index'
        end
    end
    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    def upvote
        @micropost = Micropost.find(params[:id])
        @micropost.liked_by current_user
        respond_to do |format|
            format.html {redirect_to :back }
            format.json { render json: { count: @micropost.get_upvote.size } }
        end

    end

    def downvote
        @micropost = Micropost.find(params[:id])
        @micropost.downvote_from current_user
        redirect_to request.referrer
    end
    private
    def micropost_params
        params.require(:micropost).permit(:content, :picture)
    end
    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end

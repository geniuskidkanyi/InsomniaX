class Microposts::LikesController < ApplicationController
 before_action :set_micropost
def create
  @micropost.likes.where(user_id: current_user.id).first_or_create
  respond_to do |format|
    format.html {redirect_to root_path}
    format.json { render json: @resource }
  end
end

def destroy
  @micropost.likes.where(user_id: current_user.id).destroy_all
  respond_to do |format|
    format.html {redirect_to root_path}
    format.json { render json: @resource }
  end
end

def set_micropost
  @micropost = Micropost.find(params[:micropost_id])
end

end

class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,
                only: :destroy
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referrer || root_url
  end

  def heart
    @user = current_user
    @micropost = Micropost.find(params[:id])
    @user.heart!(@micropost)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def unheart
    @user = current_user
    @heart = @user.hearts.find_by_micropost_id(params[:id])
    @micropost = Micropost.find(params[:id])
    @heart.destroy!
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
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

class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: :destroy
  def new
   @user = User.new
  end
 def index
   # if the id params is present
       if params[:id]
         # get all records with id less than 'our last id'
         # and limit the results to 5
         @users = User.where('id > ?', params[:id]).limit(5)
       else
         @users = User.limit(5)
       end
       respond_to do |format|
         format.html
         format.js
       end

end

 def show
  @user = User.find(params[:id])
  @microposts = @user.microposts.paginate(page: params[:page])
 end
 def edit
        @user = User.find(params[:id])
 end
 def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            render 'edit'
        end
 end
 def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
 end
 def create
  @user = User.new(user_params)
  if @user.save
   log_in @user
   flash[:success] = "Welcome to insomniax"
   redirect_to @user
  else
   render 'new'
  end
 end
 def following
        @title = "following"
        @user = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
 end
 def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
 end


  private
  def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :age, :description, :avatar, :birthdate, :is_female)
  end
    # Before filters
    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
    # Confirms the correct user.
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end

end

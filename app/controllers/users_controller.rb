class UsersController < ApplicationController
  before_action :authenticate_user!
before_action :admin_user, only: :destroy
  def new
   @user = User.new
  end
 def index
   @users = User.paginate(page: params[:page])

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
        if @user.update_without_password(user_params)
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
     @user.send_activation_email
     log_in @user
     flash[:success] = "Please check your email to activate your account."
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
 def about

        @user = User.find(params[:id])
      @title = @user.name
        render 'show_about'
 end


  private
  def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :age, :description, :avatar, :birthdate, :is_female, :dprofile)
  end
    # Before filters
    # Confirms a logged-in user.

    # Confirms the correct user.
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end

end

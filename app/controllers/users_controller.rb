class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]


  def show
    @user = User.find_by!(username: params[:id])
    @shouts = @user.shouts 
    @followers = @user.followers
    @followed_users = @user.followed_users 
  end 

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end


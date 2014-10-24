class FollowingRelationshipsController < ApplicationController 
  def create 
    user = User.find_by!(username: params[:id])
    current_user.follow(user)
    redirect_to user 
  end


  def destroy
    user = find_user
    current_user.unfollow(user)
    redirect_to user
  end

  private

  def find_user
    User.find_by!(username: params[:id])
  end
end 


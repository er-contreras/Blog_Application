class UsersController < ApplicationController
  def index
    @users = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts_list = @user.recent_posts
  end
end

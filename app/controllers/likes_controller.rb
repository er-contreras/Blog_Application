class LikesController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])

    if already_liked?
      redirect_to user_post_path(@current_user.id, @post)
    else
      @like = @current_user.likes.new
      @like.user_id = @current_user.id
      @like.post_id = params[:post_id]

      if @like.save
        @like.update_likes_counter
        redirect_to user_post_path(@current_user.id, @post)
      end
    end
  end

  def already_liked?
    Like.where(user_id: @current_user.id, post_id: @post.id).exists?
  end
end

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    # if post.save
    #   redirect_to action: :index
    # else
    #   redirect_to action: :new
    # end

    # flash[:notice] = 'Post was successfully created' if @post.save respond_with(@post)

    respond_to do |format|
      if @post.save
        format.html { redirect_to :index, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

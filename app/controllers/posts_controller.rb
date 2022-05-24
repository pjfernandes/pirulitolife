class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @posts = Post.all.sort.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if current_user.admin?
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    if current_user.admin?
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created!'
      else
        render :new
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:legend, :date_photo, :user_id, :photo)
  end

end

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

  private
  def post_params
    params.require(:post).permit(:legend, :date_photo, :user_id)
  end

end

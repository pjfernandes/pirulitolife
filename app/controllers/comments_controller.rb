class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post, anchor: "comment-#{@comment.id}")
    else
      render "posts/show"
    end
  end

  def destroy
    if current_user.admin?
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end

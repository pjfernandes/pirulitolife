class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end

class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :content))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end

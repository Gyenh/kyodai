class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save

      redirect_to @post
    else
      render 'new'
    end
  end

  def show; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end

  end

  def edit; end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end

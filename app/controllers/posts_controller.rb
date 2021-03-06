class PostsController < ApplicationController
  include Youtube

  before_action :authenticate_user!
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(12)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))

    parse_video_url(@post.link)
    @post.link = @results

    if @post.save
      flash[:notice] = "Musique partagée avec succès"
      redirect_to @post
    else
      flash[:alert] = "Il y a une petite erreur, merci de réessayer"
      render 'new'
    end
  end

  def show
      @random_post = Post.all.order(Arel.sql('random()')).limit(1)
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "La musique a bien été mis à jour."
    else
      flash[:alert] = "Il y a une petite erreur, merci de réessayer"
      render 'edit'
    end

  end

  def edit; end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: 'Musique bien supprimée'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :link)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))

    parse_video_url(@post.link)

    @post.link = @results

    if @post.save

      redirect_to @post
    else
      render 'new'
    end
  end

  def show
      @random_post = Post.all.order(Arel.sql('random()')).limit(1)
  end

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
    params.require(:post).permit(:title, :content, :link)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def parse_video_url(url)
    @url = url

    youtube_formats = [
        %r(https?://youtu\.be/(.+)),
        %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
        %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
        %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
        %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b),
        %r(https?://music\.youtube\.com/watch\?v=(.*?)(&|#|$))
      ]

    @url.strip!

    if @url.include? "youtu"
      youtube_formats.find { |format| @url =~ format } and $1
      @results = {id: $1}
      @results.each do |key, value|
        @results = value
      end
    else
      return nil # There should probably be some error message here
    end
  end

end

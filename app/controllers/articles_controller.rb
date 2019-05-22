class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: %i[show update edit destroy]

  def index
    @articles = Article.order('created_at DESC')
    @article = Article.new
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path, notice: "L'article a bien été créé."
    else
      render action: 'Nouveau article'
    end
  end

  def edit; end

  def update
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "L'article a bien été mis à jour."
    else
      render action: 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to @article, notice: "L'article a bien été supprimé."
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end

class ArticlesController < ApplicationController

  def index
    @articles = Article.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "L'article a bien été créer."
    else
      render action: "Nouvel article"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "The article has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @Article = Article.find(params[:id])
    @Article.destroy

    redirect_to articles_path, notice: "L'article a bien été supprimer."
  end

private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

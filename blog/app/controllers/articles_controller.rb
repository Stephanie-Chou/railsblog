class ArticlesController < ApplicationController
  def new
  end
  def create
    @article = Article.new(params[:article])
    @article.save
    redirect_to @article
  end
  def show
    @article = Article.find(params[:id])
  end


  def article_params
    p "in here"
    params.require(:article).permit(:title, :text)
  end
end

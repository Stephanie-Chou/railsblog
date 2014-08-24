class ArticlesController < ApplicationController
skip_before_filter :verify_authenticity_token
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    p "DESTROY "*50
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article
  end

  def show
    p "show "*50
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end

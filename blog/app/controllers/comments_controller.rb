class CommentsController < ApplicationController
  def create
	p "in here"
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
		p "hello"
      params.require(:comment).permit(:commenter, :body)
    end
end
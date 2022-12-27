class CommentsController < ApplicationController
	http_basic_authenticate_with name: "akki", password: "123", only: :destroy


	def show
    @article = Article.find(params[:id])

  end
   def new
   	@article =Article.find(params[:article_id])
     @comment = Comment.new(author: cookies[:commenter_name])
   end
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
      
end

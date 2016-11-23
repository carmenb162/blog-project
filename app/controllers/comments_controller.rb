class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    #^^only allow authenticated users to delete comments.

  def create
    @article = Article.find(params[:article_id])
      # ^^chooses which article a comment is going to deal with
    @comment = @article.comments.create(comment_params)
      #^^automatically links comment so it belongs to the particular article identified in @article line 3.
    redirect_to article_path(@article)
      #^^sends user back to original article using the article_path helper (which calls articles#show, which in turn renders the show.html.erb)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

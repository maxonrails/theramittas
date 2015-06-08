class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
    redirect_to article_path(Article.find(params[:article_id])) unless @comment.user == current_user
  end

  def update
    comment = Comment.find(params[:id])
    if @comment.user == current_user
      comment.update_attributes(comment_params)
    else
      redirect_to articles_path
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    @comment.article = @article

    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
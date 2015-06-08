class ArticlesController < ApplicationController
  before_action :authorized?,  only: [:new, :create]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    if current_user
      @article = Article.new(article_params)
      @article.user = current_user

      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    else
      redirect_to users_new_path
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end
end
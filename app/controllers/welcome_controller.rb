class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
  end

  def about
  end

  def home
  end
end

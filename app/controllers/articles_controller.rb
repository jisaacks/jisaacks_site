class ArticlesController < ApplicationController

  def index
    @articles = Article.published
  end

  def search
    q = params[:q]
    @articles = Article.published.where("content LIKE ? OR title LIKE ?","%#{q}%","%#{q}%")
  end

end

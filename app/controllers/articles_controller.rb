class ArticlesController < ApplicationController

  def index
    @articles = Article.published.paginate(:page => params[:page], :per_page => 3)
  end

  def search
    q = params[:q]
    @articles = Article.published.where("content LIKE ? OR title LIKE ?","%#{q}%","%#{q}%")
  end

  def show
    @article = Article.published.find(params[:id])
    redirect_to(url_for(@article), :status => 301) if params[:slug].present?
    @comments = @article.comments
    @comment = Comment.new
  end

  def comment
    @article = Article.find(params[:id])
    @comment = @article.comments.new(params[:comment])

    respond_to do |format|
      if @comment.spam? || params[:phone].present? #phone is the honeypot
        flash[:alert] = "This article looks like spam. <br><small>..Not spam? Email me and let me know.</small>".html_safe
        format.html { render :action => 'show' }
      elsif @comment.save
        format.html { redirect_to article_path(@article), notice: 'Comment submission successful.' }
      else
        flash[:alert] = @comment.errors.full_messages.to_sentence
        format.html { render :action => 'show' }
      end
    end

  end

end

class Admin::ArticlesController < AdminController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])

    if params[:article][:state] == 'public'
      @article.published_at = Time.now if @article.published_at.nil?
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to edit_admin_article_path(@article), notice: 'Article was successfully created.' }
      else
        flash[:alert] = @article.errors.full_messages.to_sentence
        format.html { render action: "new" }
      end
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
     if params[:article][:state] == 'public'
      params[:article][:published_at] = Time.now if @article.published_at.nil?
    end
    if @article.update_attributes(params[:article])
      flash[:notice] = "Updated Article: #{@article.title}"
    end

    respond_to do |format|
      format.html { redirect_to action: "edit" }
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Deleted Article: #{@article.title}"
    redirect_to :action => :index
  end
end

class Admin::ArticlesController < AdminController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to edit_admin_article_path(@article), notice: 'Article was successfully created.' }
      else
        format.html { render action: "new"  }
      end
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    respond_to do |format|
      format.html { render action: "edit"  }
    end
  end
end

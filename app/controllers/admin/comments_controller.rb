class Admin::CommentsController < AdminController

  def index
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.save
      flash[:notice] = "Comment Updated"
      redirect_to :action => :index
    else
      flash[:alert] = @comment.errors.full_messages.to_sentence
      render :action => :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Deleted Comment"
    redirect_to :action => :index
  end
end

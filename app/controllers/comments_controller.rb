class CommentsController < ApplicationController

  def reply
    @reply_to = Comment.find(params[:id])
    @reply = Comment.new
  end

  def create_reply
    @reply_to = Comment.find(params[:id])
    @reply = @reply_to.comments.new(params[:comment])

    respond_to do |format|
      if @reply.spam?
        flash[:alert] = "This article looks like spam. <br><small>..Not spam? Email me and let me know.</small>".html_safe
        format.html { render :action => 'reply' }
      elsif @reply.save
        format.html { redirect_to article_path(@reply_to.article), notice: 'Reply submission successful.' }
      else
        flash[:alert] = @reply.errors.full_messages.to_sentence
        format.html { render :action => 'reply' }
      end
    end
  end

end

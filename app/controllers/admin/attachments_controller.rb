class Admin::AttachmentsController < AdminController

  def index
    @files = Attachment.order('attachments.created_at DESC').all
  end

  def new

  end

  def create
    file = params[:attachment][:file] if params[:attachment]
    unless file.nil?
      @att = Attachment.new({
        name:   file.original_filename,
        format: file.content_type,
        data:   file.tempfile.read
      })
    end
    if @att && @att.save
      redirect_to :action => :index
    elsif file.present?
      flash[:alert] = @att.errors.full_messages.to_sentence
      render :action => 'new'
    else
      flash[:alert] = 'Please select a file.'
      render :action => 'new'
    end
  end

  def destroy
    file_name = "#{params[:id]}.#{params[:format]}"
    @file = Attachment.find(file_name)
    @file.destroy
    flash[:notice] = "Deleted #{file_name}"
    redirect_to :action => :index
  end

end

class AttachmentsController < ApplicationController

  def show
    file_name = "#{params[:id]}.#{params[:format]}"
    @file = Attachment.find(file_name)
    respond_to do |format|
      format.png {
        render :text => @file.data
      }
      format.jpeg {
        render :text => @file.data
      }
    end
  end

end

class Admin::PhotosController < AdminController

  def index
    @photos = Photo.order('created_at DESC').all
  end

  def new

  end

  def create
    file = params[:photo][:file] if params[:photo]
    unless file.nil?
      img = Imgur::API.new ENV["IMGUR_API_KEY"]

      uploaded_img = img.upload_file file.tempfile.path

      photo = Photo.new
      photo.info = HashWithIndifferentAccess.new uploaded_img
    end
    if photo && photo.save
      redirect_to :action => :index
    elsif file.present?
      flash[:alert] = photo.errors.full_messages.to_sentence
      render :action => 'new'
    else
      flash[:alert] = 'Please select a file.'
      render :action => 'new'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to :action => :index
  end

end

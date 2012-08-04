class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :if => :admin_namespace?
  if ENV['RACK_ENV'] == 'test'
    before_filter :authenticate_user!
  end

  def admin_namespace?
    params[:controller].split("/").first == "admin"
  end

end

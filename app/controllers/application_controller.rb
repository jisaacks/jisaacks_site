class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :if => :admin_namespace?

  def admin_namespace?
    params[:controller].split("/").first == "admin"
  end

end

class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin

  private

  def authorize_admin
    authorize! :manage, :all
  end

end

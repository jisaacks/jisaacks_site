class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def new
    render :text => "TODO Add 'new' view"
  end
end

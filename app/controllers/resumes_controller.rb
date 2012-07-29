class ResumesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.pdf { render(:pdf => "resume", :layout => "pdf.html.haml", :template => "resumes/index.pdf.haml", :show_as_html => params[:debug].present?, :zoom => 0.75, :encoding => 'utf-8', :page_size => 'letter') }
    end
  end

end

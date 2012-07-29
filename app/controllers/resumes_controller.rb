class ResumesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.pdf do
        pdf_options = {
          pdf:          "resume",
          layout:       "pdf.html.haml",
          template:     "resumes/index.pdf.haml",
          show_as_html: params[:debug].present?,
          zoom:         0.75, 
          encoding:     'utf-8',
          page_size:    'letter'
        }
        render(pdf_options)
      end
    end
  end

end

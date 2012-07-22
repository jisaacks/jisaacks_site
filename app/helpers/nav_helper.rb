module NavHelper
  def nav_link text, url, options
    if params[:controller] == options.delete(:controller)
      options[:class] += " selected"
    end
    link_to text, url, options
  end
end
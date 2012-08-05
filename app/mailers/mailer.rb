class Mailer < ActionMailer::Base
  default from: "jisaacks@jisaacks.com"
  
  def new_comment(comment)
    @comment = comment
    mail(:to => 'jd@jisaacks.com', :subject => "New Comment on Jisaacks.com")
  end
end

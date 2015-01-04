class ModelMailer < ActionMailer::Base
  default from: "BisonShare"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #  en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(email, message, buyer, book, seller)
    @message = message
    @buyer = buyer
    @seller = seller
    @book= book
    mail to: email , subject: "You have a new book request on BisonShare!"
  end
  
  def welcome_email(email, name)
    @name= name
    mail to: email , subject: "Welcome to BisonShare!"
  end

  def ad_mail(email, message, name)
    @message= message
    @name =name
    @email=email 
    mail to: "bisonshare@gmail.com" , subject: "New Message"
  end
  
  def value_mail(name, title, condition, email, comment)
    @name=name
    @title=title
    @condition=condition
    @comment=comment
    mail to: "bisonshare@gmail.com" , subject: "Esteem Requested"
  end
  
end

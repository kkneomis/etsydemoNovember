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
  
  def welcome_email(user)
    @user= user
    
    mail to: user.email , subject: "You have a new book request on BisonShare!"
  end

  
end

class ModelMailer < ActionMailer::Base
  default from: "meccashare@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #  en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(email, message)
    @message = message
    mail to: email , subject: "Welcome to MeccaShare!"
  end
  

  
end

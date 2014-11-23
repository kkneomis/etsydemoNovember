class ModelMailer < ActionMailer::Base
  default from: "meccashare@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #  en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
    @record = record
    email = "skakpovi@gmail.com"
    mail to: email , subject: "Welcome to MeccaShare!"
  end
  
  def new_record_notification(welcome)
    @welcome = welcome
    email = "skakpovi@gmail.com"
    mail to: email , subject: "Welcome to MeccaShare!"
  end
  
end

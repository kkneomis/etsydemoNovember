class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
  end
    
   class UsersController < ApplicationController
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(params[:user])
    if @user.save
      render text: "Thank you! You will receive an SMS shortly with verification instructions."
      
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @user.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )
    else
      render :new
    end
  end
 
end
    end
  end
end

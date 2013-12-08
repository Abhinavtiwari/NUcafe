class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action(:authenticate_user!)

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :phone, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
    }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  def send_text_message(phone_number, text_message)
       twilio_sid = ENV["twilio_sid"].to_s
       twilio_token = ENV["twilio_token"].to_s
       twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
       success = twilio_client.account.sms.messages.create(from: "+19196663079", to: phone_number, body: text_message) #hard coded my number
  end


 

end

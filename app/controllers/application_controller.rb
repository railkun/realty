class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar , :phone_number, :phone_number, :phone_number)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password, :remember_me, :avatar, :phone_number, :phone_number)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :phone_number)
    end  



  end

end

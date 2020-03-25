class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_account
    @_current_account ||= current_user.account
  end

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email, :password, :password_confirmation)
  end
end
end

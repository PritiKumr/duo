class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_account
    @_current_account ||= current_user.account
  end
end

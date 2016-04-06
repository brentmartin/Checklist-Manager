class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return if session[:user_id].nil?
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def signed_in?
    session[:user_id].present?
  end
  helper_method :signed_in?

  def authenticate_user
    if session[:user_id].nil?
      flash[:alert] = "You must be signed in first to do that."
      redirect_to sign_in_path
    end
  end

end

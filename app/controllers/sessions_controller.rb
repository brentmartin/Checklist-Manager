class SessionsController < ApplicationController
  def sign_in
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in!"
      redirect_to root_path
    else
      flash[:alert] = "Incorrect email or password"
      render :sign_in
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end

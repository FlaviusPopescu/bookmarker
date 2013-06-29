class SessionsController < ApplicationController

  skip_before_filter :authenticate

  def new
    redirect_to root_path, notice: 'You are already signed in' if current_user
  end

  def create
    if user && user.authenticated?(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Yey! Signed in!'
    else
      flash.now.alert = 'Email password combination does not match. Make sure you enter the right combo and try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  private

  def user
    @user ||= User.find_by_email(params[:email])
  end

end

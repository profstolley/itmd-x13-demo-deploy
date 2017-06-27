class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(uid: session[:user_uid])
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    session[:user_uid] = user.uid
    session[:user_name] = user.name
  end

  def signed_in?
    !!current_user
  end

  def authenticate_user
    unless signed_in?
      redirect_to login_url, notice: "Please log in first"
    end
  end

end

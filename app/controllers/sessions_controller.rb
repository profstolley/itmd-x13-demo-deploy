class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    if signed_in?
      redirect_to posts_url
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_or_create_by(uid: auth_hash['uid']) do |user|
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
      user.image_url = auth_hash['info']['image']
    end
    self.current_user = @user
    redirect_to posts_url
  end

  def logout
    reset_session
    redirect_to login_url, notice: 'You have been logged out'
  end
end

class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    # binding.pry
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
      :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to user_path user, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to '/', :notice => 'Signed out'
  end

end

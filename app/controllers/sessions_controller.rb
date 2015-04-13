class SessionsController < ApplicationController

  def new

  end

 def create
    @user = User.find_by_email(params[:email])
    # binding.pry
    if @user && @user.authenticate(params[:password]) # If the user exists AND the password entered is correct.

      session[:user_id] = user.id
      redirect_to user_path @user
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
class UsersController < ApplicationController
  def show
  end

  def new
    # @user = User.new(user_params)

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

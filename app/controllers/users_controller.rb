class UsersController < ApplicationController

  def show
      @all_users = User.all
  end

  def new
    # @user = User.new(user_params)
  end

  def search
    parameters = { term: params[:search]["keyword"], category_filter: "fitness", limit: 10 }
    @results = Yelp.client.search('San Francisco', parameters)
    render json: @results
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render json: @user.errors.full_messages
    end
  end



  def login
    @user = User.find_by_email(params['login']['email'])
    if @user && @user.authenticate(params['login']['password'])
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render new_user_path @user
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

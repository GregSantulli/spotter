class UsersController < ApplicationController
  def show
  end

  def new
    # @user = User.new(user_params)

  end

  def search
    parameters = { term: params[:search]["keyword"], category_filter: "fitness", limit: 10 }

    @results = Yelp.client.search('San Francisco', parameters)

    # binding.pry

    render json: @results
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


  def login
    @user = User.find_by_email(params['login']['email'])
    if @user && @user.authenticate(params['login']['password']) # If the user exists AND the password entered is correct.
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/'
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

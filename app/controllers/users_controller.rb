class UsersController < ApplicationController

  def show
    unless current_user
      redirect_to root_path
    end
    @all_users = User.all
    @unswiped_users = current_user.unswiped_users
  end

  def new
    if current_user
      redirect_to user_path current_user
    end
  end

  def search
    parameters = { category_filter: "fitness", limit: 10 }
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

  def edit
    @user = User.find(params[:id])
    @gym = Gym.where(yelp_id: params["gym"]["yelp_id"]).first || Gym.create(gym_params)
    Membership.create(user_id: @user.id, gym_id: @gym.id)
    redirect_to user_path @user
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


  def gym_params
    params.require(:gym).permit(:name, :yelp_id, :address)
  end

end

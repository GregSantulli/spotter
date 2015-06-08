class SwipesController < ApplicationController

  def create
    swipee = User.find(swipe_params[:swipee_id])
    Swipe.create(swipe_params)
    if current_user.is_match?(swipee)
      render json: swipee
    else
      render json: {}
  end

  private

  def swipe_params
    params.require(:swipe).permit(:user_id, :swipee_id, :like)
  end

end

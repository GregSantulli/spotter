class SwipesController < ApplicationController


  def create


    # Swipe.create(
    #   swiper_id: swipe_params[:swiper_id],
    #   swipee_id: swipe_params[:swipee_id],
    #   like: swipe_params[:like]
    #   )

    swipe = Swipe.create(swipe_params)

    render json: swipe

  end


  private

  def swipe_params
    params.require(:swipe).permit(:user_id, :swipee_id, :like)
  end

end

class ChangeLikerToSwiper < ActiveRecord::Migration
  def change
    rename_column :swipes, :liker_id, :swiper_id
  end
end

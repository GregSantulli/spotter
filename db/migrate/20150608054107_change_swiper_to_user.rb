class ChangeSwiperToUser < ActiveRecord::Migration
  def change
    rename_column :swipes, :swiper_id, :user_id

  end
end

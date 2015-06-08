class ChangeUserToSwipee < ActiveRecord::Migration
  def change
    rename_column :swipes, :user_id, :swipee_id
  end
end

class AddLikeToSwipe < ActiveRecord::Migration
  def change
    add_column :swipes, :like, :boolean
  end
end

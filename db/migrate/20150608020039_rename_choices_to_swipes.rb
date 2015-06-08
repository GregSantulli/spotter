class RenameChoicesToSwipes < ActiveRecord::Migration
  def change
    rename_table :choices, :swipes
  end
end

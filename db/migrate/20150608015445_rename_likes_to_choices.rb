class RenameLikesToChoices < ActiveRecord::Migration
  def change
    rename_table :likes, :choices
  end
end

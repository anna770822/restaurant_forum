class ChangeIntroToText < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :intro
    add_column :users, :introm, :text
  end
end

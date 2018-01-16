class RenameIntromToIntro < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :introm, :intro
  end
end

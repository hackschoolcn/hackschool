class FixUserSex < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :sex, :gender
  end
end

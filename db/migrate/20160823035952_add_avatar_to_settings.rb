class AddAvatarToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :avatar, :string
  end
end

class AddMoreDetailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :nickname, :string
    add_column :users, :hobbies, :string
    add_column :users, :sex, :string
    add_column :users, :selfintroduction, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :string
  end
end

class AddVideoToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :video, :string
  end
end

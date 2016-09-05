class AddPositionToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :position, :integer
  end
end

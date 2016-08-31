class AddPositionToChapter < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :position, :integer
  end
end

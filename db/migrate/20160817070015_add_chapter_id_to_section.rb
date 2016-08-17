class AddChapterIdToSection < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :chapter_id, :integer
  end
end

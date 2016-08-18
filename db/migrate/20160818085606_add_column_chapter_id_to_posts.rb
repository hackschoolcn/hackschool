class AddColumnChapterIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :chapter_id, :integer
  end
end

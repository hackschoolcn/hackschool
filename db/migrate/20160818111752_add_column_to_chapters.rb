class AddColumnToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :description, :text
  end
end

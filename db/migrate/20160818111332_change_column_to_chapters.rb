class ChangeColumnToChapters < ActiveRecord::Migration[5.0]
  def change
    rename_column :chapters, :chapter, :title
  end
end

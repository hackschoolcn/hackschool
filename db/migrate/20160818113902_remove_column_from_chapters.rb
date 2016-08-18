class RemoveColumnFromChapters < ActiveRecord::Migration[5.0]
  def change
    remove_column :chapters, :description, :text
  end
end

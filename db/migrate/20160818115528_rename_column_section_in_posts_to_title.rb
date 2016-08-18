class RenameColumnSectionInPostsToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :section, :title
  end
end

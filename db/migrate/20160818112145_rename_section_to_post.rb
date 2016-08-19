class RenameSectionToPost < ActiveRecord::Migration[5.0]
  def change
    rename_table :sections, :posts
  end
end

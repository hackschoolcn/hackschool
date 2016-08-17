class AddSectionIdToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :section_id, :integer
  end
end

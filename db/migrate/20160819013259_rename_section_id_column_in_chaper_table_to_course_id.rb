class RenameSectionIdColumnInChaperTableToCourseId < ActiveRecord::Migration[5.0]
  def change
    rename_column :chapters, :section_id, :course_id
  end
end

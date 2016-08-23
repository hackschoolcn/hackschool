class RenameColumnCourseIdToPostIdInTableTask < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :course_id, :post_id
  end
end

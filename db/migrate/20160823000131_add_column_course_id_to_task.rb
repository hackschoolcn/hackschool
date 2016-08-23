class AddColumnCourseIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :course_id, :integer
  end
end

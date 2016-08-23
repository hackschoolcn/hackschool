class AddColumnCourseIdToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :course_id, :integer
  end
end

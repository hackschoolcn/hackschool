class AddColumnCourseIdToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :course_id, :integer
  end
end

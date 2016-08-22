class AddCourseIdColumnToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :course_id, :integer
  end
end

class AddCourseIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :course_id, :integer
  end
end

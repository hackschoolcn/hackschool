class AddTeacherNameToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :teacher_name, :string
  end
end

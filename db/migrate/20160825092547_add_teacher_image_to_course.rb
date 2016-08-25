class AddTeacherImageToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :teacher_image, :string
  end
end

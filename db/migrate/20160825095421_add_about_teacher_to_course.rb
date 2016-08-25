class AddAboutTeacherToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :about_teacher, :text
  end
end

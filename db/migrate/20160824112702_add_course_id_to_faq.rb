class AddCourseIdToFaq < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :course_id, :integer
  end
end

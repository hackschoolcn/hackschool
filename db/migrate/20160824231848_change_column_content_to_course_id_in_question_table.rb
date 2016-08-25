class ChangeColumnContentToCourseIdInQuestionTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :content
    add_column :questions, :course_id, :integer
  end
end

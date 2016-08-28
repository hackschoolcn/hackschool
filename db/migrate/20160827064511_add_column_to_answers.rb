class AddColumnToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :course_id, :integer
  end
end

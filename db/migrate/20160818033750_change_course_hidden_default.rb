class ChangeCourseHiddenDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :courses, :is_hidden, :boolean, default: true
  end
end

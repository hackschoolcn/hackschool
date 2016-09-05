class ChangeColumnDescriptionDatatypeToTextInTaskTable < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :description, :text
  end
end

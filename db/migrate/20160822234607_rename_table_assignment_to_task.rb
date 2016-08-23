class RenameTableAssignmentToTask < ActiveRecord::Migration[5.0]
  def change
    rename_table :assignments, :tasks
  end
end

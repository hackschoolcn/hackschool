class RenameColumnAssignmentIdToTaskId < ActiveRecord::Migration[5.0]
  def change
    rename_column :works, :assignment_id, :task_id
  end
end

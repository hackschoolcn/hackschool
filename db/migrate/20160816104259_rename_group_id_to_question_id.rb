class RenameGroupIdToQuestionId < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :group_id, :question_id
  end
end

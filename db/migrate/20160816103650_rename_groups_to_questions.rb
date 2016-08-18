class RenameGroupsToQuestions < ActiveRecord::Migration[5.0]
  def change
    rename_table :groups, :questions
  end
end

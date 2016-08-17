class RenamePostsToAnswers < ActiveRecord::Migration[5.0]
  def change
    rename_table :posts, :answers
  end
end

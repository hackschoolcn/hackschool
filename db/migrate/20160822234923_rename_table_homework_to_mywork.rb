class RenameTableHomeworkToMywork < ActiveRecord::Migration[5.0]
  def change
    rename_table :homeworks, :works
  end
end

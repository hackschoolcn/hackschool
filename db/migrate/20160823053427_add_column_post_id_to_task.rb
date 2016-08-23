class AddColumnPostIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :post_id, :integer
  end
end

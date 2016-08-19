class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :description
      t.datetime :due_time

      t.timestamps
    end
  end
end

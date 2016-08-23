class RemoveServiceModel < ActiveRecord::Migration[5.0]
  def up
    drop_table :services
  end

  def down
    create_table :services do |t|
      t.float     "price", default: 0.0
      t.integer   "order_id"
      t.integer   "user_id"
      t.string    "title"
      t.string    "description"
      t.string    "status"
      t.datetime  "due_date"

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float    "amount",            default: 0.0
      t.integer  "user_id"
      t.string   "token"
      t.string   "payment_method"

      t.timestamps
    end
  end
end

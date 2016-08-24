class AddColumnDescriptionToOrderTable < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :description, :string
  end
end

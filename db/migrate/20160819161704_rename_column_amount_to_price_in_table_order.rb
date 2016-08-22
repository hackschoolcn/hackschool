class RenameColumnAmountToPriceInTableOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :amount, :price
  end
end

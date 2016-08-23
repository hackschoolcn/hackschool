class RenameColumnPriceToSubscriptionMonthsInTableOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :price, :subscription_months
  end
end

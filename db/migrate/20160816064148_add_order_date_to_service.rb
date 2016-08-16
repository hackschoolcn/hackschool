class AddOrderDateToService < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :order_date, :datetime
  end
end

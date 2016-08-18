class AddOrderPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :price, :integer
    add_column :users, :member_expire_date, :datetime
  end
end

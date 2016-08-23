class ChangeDefaultValueOfExpireDateInTableUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :member_expire_date, :date, default: Date.new(1990, 2, 15)
  end
end

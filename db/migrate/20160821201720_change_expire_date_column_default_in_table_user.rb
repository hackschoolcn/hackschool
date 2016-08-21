class ChangeExpireDateColumnDefaultInTableUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :member_expire_date, :date, default: nil
  end
end

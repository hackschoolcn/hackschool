class ChangeDefaultValueOfUserExpireDate < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :member_expire_date, :member_expire_date, default: Time.now
  end
end

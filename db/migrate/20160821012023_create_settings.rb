class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :username
      t.string :nickname
      t.string :hobbies
      t.string :birthday
      t.string :sex
      t.string :selfintroduction
      t.string :address

      t.timestamps
    end
  end
end

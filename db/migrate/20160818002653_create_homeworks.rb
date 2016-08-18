class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.text :content
      t.integer :assignment_id
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end

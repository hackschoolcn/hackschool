class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :is_hidden
      
      t.timestamps
    end
  end
end

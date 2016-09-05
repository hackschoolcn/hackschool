class AddHeroTitleToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :hero_title, :string
  end
end

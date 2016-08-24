class AddHeroImageToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :hero_image, :string
  end
end

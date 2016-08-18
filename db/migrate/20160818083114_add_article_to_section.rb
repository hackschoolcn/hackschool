class AddArticleToSection < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :article, :text
  end
end

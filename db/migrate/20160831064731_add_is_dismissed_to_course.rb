class AddIsDismissedToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_dismissed, :boolean, default: true
  end
end

class AddColumnFaqToCourseTable < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :faq, :text
  end
end

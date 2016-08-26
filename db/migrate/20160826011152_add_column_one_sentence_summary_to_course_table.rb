class AddColumnOneSentenceSummaryToCourseTable < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :one_sentence_summary, :string
  end
end

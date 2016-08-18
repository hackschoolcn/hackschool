class Post < ApplicationRecord
  belongs_to :chapter
end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chapter_id  :integer
#  title       :string
#  description :text
#

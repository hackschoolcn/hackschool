require 'test_helper'

class PostTest < ActiveSupport::TestCase
  belongs_to :chapter_id
  #   assert true
  # end
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

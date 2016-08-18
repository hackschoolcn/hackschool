# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  chapter    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer
#

require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

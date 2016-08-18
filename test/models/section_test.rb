# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  section    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer
#  article    :text
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

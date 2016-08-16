# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  price       :float            default(0.0)
#  order_id    :integer
#  user_id     :integer
#  title       :string
#  description :string
#  status      :string
#  due_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

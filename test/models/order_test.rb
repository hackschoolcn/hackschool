# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  amount         :float            default(0.0)
#  user_id        :integer
#  token          :string
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  aasm_state     :string           default("unpaid")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

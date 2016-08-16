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

class Service < ApplicationRecord
  belongs_to :order
  belongs_to :user
end

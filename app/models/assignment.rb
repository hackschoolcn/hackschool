# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  description :string
#  due_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ApplicationRecord

  has_many :homeworks,  dependent: :destroy

end

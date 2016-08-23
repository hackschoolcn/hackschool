# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :string
#  due_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  post_id     :integer
#

class Task < ApplicationRecord

  belongs_to :post
  belongs_to :course
  has_many :works,  dependent: :destroy

end

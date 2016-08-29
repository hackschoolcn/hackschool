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
  has_many :works, dependent: :destroy

  def submitted_users_in_percent
    submitted_works_num = works.count
    all_enrolled_users_num = course.enrolled_users.count

    if all_enrolled_users_num.positive?
      (submitted_works_num.to_f / all_enrolled_users_num.to_f * 100).round(1)
    else
      0
    end
  end
end

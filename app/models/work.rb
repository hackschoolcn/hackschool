# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  content    :text
#  task_id    :integer
#  user_id    :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#

class Work < ApplicationRecord

  belongs_to :task
  belongs_to :user
  belongs_to :course
  
end

class CourseRelationship < ApplicationRecord
  belongs_to :course
  belongs_to :user
end

# == Schema Information
#
# Table name: course_relationships
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

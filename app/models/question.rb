# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  course_id   :integer
#

class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :answers
  
  validates :title, presence: true
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :course

  validates :content, presence: true

  scope :recent, -> { order("created_at DESC") }
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  content     :text
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

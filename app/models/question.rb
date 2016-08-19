<<<<<<< HEAD
=======
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
#  content     :text
#

>>>>>>> origin/develop
class Question < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :answers
  validates :title, presence: true
end

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
#  content     :text
#

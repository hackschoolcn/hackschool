# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer
#  course_id  :integer
#

class Chapter < ApplicationRecord
  has_many :sections,  dependent: :destroy

  has_many :posts
  belongs_to :course
end

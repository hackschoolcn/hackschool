# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  chapter    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#

class Chapter < ApplicationRecord
    belongs_to :course
    has_many :posts, dependent: :destroy

end

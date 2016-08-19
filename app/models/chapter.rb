# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
<<<<<<< HEAD
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer
=======
#  chapter    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
>>>>>>> origin/develop
#  course_id  :integer
#

class Chapter < ApplicationRecord
<<<<<<< HEAD
  has_many :sections,  dependent: :destroy

  has_many :posts
  belongs_to :course
=======
    belongs_to :course
    has_many :posts, dependent: :destroy

>>>>>>> origin/develop
end

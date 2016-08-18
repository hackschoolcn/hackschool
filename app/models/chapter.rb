# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  chapter    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer
#

class Chapter < ApplicationRecord
    has_many :posts, dependent: :destroy
end

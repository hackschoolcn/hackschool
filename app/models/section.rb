# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  section    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer
#  article    :text
#

class Section < ApplicationRecord
  belongs_to :chapter
end

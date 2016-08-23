# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  content       :text
#  assignment_id :integer
#  user_id       :integer
#  image         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Work < ApplicationRecord

  belongs_to :task
  
end

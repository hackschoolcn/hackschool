# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  is_hidden   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Course < ApplicationRecord
mount_uploader :image, ImageUploader

def publish!
  self.is_hidden = false
  self.save
end

def hide!
  self.is_hidden = true
  self.save
end

end

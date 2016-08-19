# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  price        :integer
#  is_hidden    :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image        :string
#  teacher_name :string
#

class Course < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :chapters


  scope :published, -> { where(is_hidden: false) }

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
end

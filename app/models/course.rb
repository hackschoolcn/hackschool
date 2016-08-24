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
#  hero_image   :string
#

class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :hero_image, HeroImageUploader

  has_many :chapters, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :faqs
  has_many :tasks
  has_many :works
  has_many :enrollments
  has_many :enrolled_users, through: :enrollments, source: :user

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order("created_at DESC") }

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end

  def is_hidden?
    is_hidden
  end
end

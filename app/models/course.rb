class Course < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :hero_image, HeroImageUploader
  mount_uploader :teacher_image, TeacherImageUploader

  has_many :chapters, -> { order(position: :asc) }, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :faqs
  has_many :tasks
  has_many :works
  has_many :questions
  has_many :enrollments
  has_many :enrolled_users, through: :enrollments, source: :user
  has_many :course_relationships
  has_many :favorite_users, through: :course_relationships, source: :user

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

  def hidden?
    is_hidden
  end
end

# == Schema Information
#
# Table name: courses
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :text
#  price                :integer
#  is_hidden            :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  image                :string
#  teacher_name         :string
#  hero_image           :string
#  faq                  :text
#  teacher_image        :string
#  about_teacher        :text
#  one_sentence_summary :string
#  hero_title           :string
#

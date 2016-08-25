# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  member_expire_date     :date
#  username               :string
#  nickname               :string
#  hobbies                :string
#  gender                 :string
#  selfintroduction       :string
#  address                :string
#  birthday               :string
#  avatar                 :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

#  username               :string
#  nickname               :string
#  hobbies                :string
#  gender                 :string
#  selfintroduction       :string
#  address                :string
#  birthday               :string
#  avatar                 :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

#  member_expire_date     :date             default(Thu, 15 Feb 1990)
#  username               :string
#  nickname               :string
#  hobbies                :string
#  gender                 :string
#  selfintroduction       :string
#  address                :string
#  birthday               :string

#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :setting
  has_many :questions
  has_many :answers
  has_many :orders
  has_many :works
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  validates :username, presence: true

  mount_uploader :avatar, AvatarUploader

  def admin?
    is_admin || email == "manyi@123.com"
  end

  # def turn_to_admin!
  #   self.is_admin = true
  #   self.save
  # end

  # def turn_to_user!
  #   self.is_admin = false
  #   self.save
  # end

  def is_valid_subscriber?
    member_expire_date && member_expire_date > Time.now
  end

  def enroll_course!(course)
    unless member_of?(course)
      enrolled_courses << course
    end
  end

  def drop_course!(course)
    enrolled_courses.delete(course)
  end

  def member_of?(course)
    enrolled_courses.include?(course)
  end

  def add_subscription_date!(amount)
    begin_date =
      if member_expire_date && member_expire_date > Time.zone.now
        member_expire_date
      else
        Time.zone.now
      end
    self.member_expire_date = begin_date + amount.month
    save
  end
end

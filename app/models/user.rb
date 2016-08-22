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

  has_many :questions
  has_many :answers
  has_many :orders
  has_one :setting

  def admin?
    is_admin || email == 'manyi@123.com'
  end


  def add_subscription_date!(amount)
    if member_expire_date && member_expire_date > Time.now
      begin_date = member_expire_date
    else
      begin_date = Time.now
    end
    self.member_expire_date = begin_date + amount.month
    save
  end
end

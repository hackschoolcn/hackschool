# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  hide        :boolean
#  publish     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
end

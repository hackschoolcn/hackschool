class Faq < ApplicationRecord
  belongs_to :course
end

# == Schema Information
#
# Table name: faqs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

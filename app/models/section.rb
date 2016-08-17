class Section < ApplicationRecord
  has_many :chapters
  belongs_to :course
end

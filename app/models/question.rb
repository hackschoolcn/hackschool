class Question < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :answers
  validates :title, presence: true
end

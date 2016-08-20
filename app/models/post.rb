# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer
#  article    :text
#  is_hidden  :boolean          default(TRUE)
#

class Post < ApplicationRecord
  belongs_to :chapter

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end
  
end

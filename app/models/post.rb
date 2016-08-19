<<<<<<< HEAD
class Post < ApplicationRecord
  belongs_to :chapter
end

=======
>>>>>>> origin/develop
# == Schema Information
#
# Table name: posts
#
<<<<<<< HEAD
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chapter_id  :integer
#  title       :string
#  description :text
#
=======
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :integer
#  article    :text
#

class Post < ApplicationRecord
  belongs_to :chapter
end
>>>>>>> origin/develop

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
#  course_id  :integer
#  position   :integer
#  video      :string
#

class Post < ApplicationRecord
  belongs_to :chapter
  acts_as_list scope: :chapter
  belongs_to :course

  has_many :tasks, dependent: :destroy

  scope :published, -> { where(is_hidden: false) }
  #  scope :current_course, -> (course_id) { where course_id: course_id }

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

  def current_index
    course.posts.find_index(self)
  end

  def may_prev?
    index = current_index

    return false unless index.positive?

    index -= 1
    prev_post = course.posts[index]

    while (prev_post.chapter.hidden? || prev_post.hidden?) && index.positive?
      index -= 1
      prev_post = course.posts[index]
    end

    if index < 1 && (prev_post.chapter.hidden? || prev_post.hidden?) # 检查是否找到最后都没找到已发布的
      false
    else
      prev_post
    end
  end

  def may_next?
    index = current_index

    return false unless index < course.posts.length - 1

    index += 1
    next_post = course.posts[index]
    while (next_post.chapter.hidden? || next_post.hidden?) && index < course.posts.length - 1
      index += 1
      next_post = course.posts[index]
    end

    if index > course.posts.length - 2 && (next_post.chapter.hidden? || next_post.hidden?) # 检查是否找到最后都没找到已发布的
      false
    else
      next_post
    end
  end
end

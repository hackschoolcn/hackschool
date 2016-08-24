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
#

class Post < ApplicationRecord
  belongs_to :chapter
  belongs_to :course

  has_many :tasks, dependent: :destroy

  scope :published, -> { where(is_hidden: false) }

  def publish!
    self.is_hidden = false
    save
  end

  def hide!
    self.is_hidden = true
    save
  end

  def is_hidden?
    is_hidden
  end

  def may_prev?
    course = self.course
    index = course.posts.find_index(self)

    if index.positive?

      index -= 1
      post = course.posts[index]
      while (post.chapter.is_hidden? || post.is_hidden?) && index.positive?
        index -= 1
        post = course.posts[index]
      end

      if index < 1 && (post.chapter.is_hidden? || post.is_hidden?) # 检查是否找到最后都没找到已发布的
        false
      else
        post
      end

    else
      false
    end
  end

  def may_next?
    course = self.course
    index = course.posts.find_index(self)

    if index < course.posts.length - 1
      index += 1
      post = course.posts[index]
      while (post.chapter.is_hidden? || post.is_hidden?) && index < course.posts.length - 1
        index += 1
        post = course.posts[index]
      end

      if index > course.posts.length - 2 && (post.chapter.is_hidden? || post.is_hidden?) # 检查是否找到最后都没找到已发布的
        false
      else
        post
      end

    else
      false
    end
  end
end

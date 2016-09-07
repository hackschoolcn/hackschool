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

  def prev_post

    if post.first?
      if chapter.first?
        return false
      else
        chapter = chapter.higher_item
        return chapter.posts.last
      end
    else
      return  post.higher_item
    end

  end


  def may_prev?
    chapter = self.chapter
    post = self

    while post.prev_post && (prev_post.chapter.hidden? || prev_post.hidden?)

      prev_post = prev_post.higher_item

    end

    if prev_post.first? && (prev_post.chapter.hidden? || prev_post.hidden?) # 检查是否找到最后都没找到已发布的
      return false
    else
      return prev_post
    end
  end


  def may_next?

    if self.last?
     return false
    end 

    next_post = self.lower_item

    while (next_post.chapter.hidden? || next_post.hidden?) && !next_post.last?
      next_post = next_post.lower_item
    end

    if index > course.posts.length - 2 && (next_post.chapter.hidden? || next_post.hidden?) # 检查是否找到最后都没找到已发布的
      return false
    else
      return next_post
    end
  end
end

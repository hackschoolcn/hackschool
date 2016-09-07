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


  def may_prev?
    post = self
    prev_post = post.get_prev_post

    while prev_post && (prev_post.hidden? || prev_post.chapter.hidden?)
      post = prev_post
      prev_post = post.get_prev_post
    end

    if prev_post && !(prev_post.hidden? || prev_post.chapter.hidden?) # 检查是否找到最后都没找到已发布的
      return prev_post
    else
      return false
    end
  end


  def may_next?
    post = self
    next_post = post.get_next_post


    while next_post && (next_post.chapter.hidden? || next_post.hidden?)
      post = next_post
      next_post = post.get_next_post
    end

    if next_post && !(next_post.hidden? || next_post.chapter.hidden?) # 检查是否找到最后都没找到已发布的
      return next_post
    else
      return false
    end
  end


  protected

  def get_prev_post
    post = self
    chapter = post.chapter

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


  def get_next_post
    post = self
    chapter = post.chapter

    if post.last?
      if chapter.last?
        return false
      else
        chapter = chapter.lower_item
        return chapter.posts.first
      end
    else
      return  post.lower_item
    end
  end

end

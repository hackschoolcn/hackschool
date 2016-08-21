module Account::PostsHelper
  def render_prev_next_buttons(post)
    may_prev = may_prev?(post) 
    may_next = may_next?(post)

    if may_prev && may_next
      render(partial: "account/posts/prev_button") + render(partial: "account/posts/next_button")
    elsif may_prev
      render(partial: "account/posts/prev_button")
    elsif may_next
      render(partial: "account/posts/next_button")
    end
  end

  private

  def may_prev?(post)
    course = post.course
    index = course.posts.find_index(post)

    if index > 0

      index -= 1
      post = course.posts[index]
      while (post.chapter.is_hidden || post.is_hidden) && index > 0
        index -= 1
        post = course.posts[index]
      end

      if index < 1 && (post.chapter.is_hidden || post.is_hidden)          #检查是否找到最后都没找到已发布的
        false
      else
        true
      end

    else
      false
    end

  end

  def may_next?(post)
    course = post.course
    index = course.posts.find_index(@post)

    if index < course.posts.length - 1
      index += 1
      post = course.posts[index]
      while (post.chapter.is_hidden || post.is_hidden) && index < course.posts.length - 1
        index += 1
        post = course.posts[index]
      end

      if index > course.posts.length - 2 && (post.chapter.is_hidden || post.is_hidden)   #检查是否找到最后都没找到已发布的
        false
      else
        true
      end

    else
      false
    end
  end

end


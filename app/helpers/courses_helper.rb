module CoursesHelper
  def render_course_teacher_name(course)
    course.teacher_name
  end

  def render_course_image(course, size = :thumb)
    if course.image.present?
      render_real_course_image(course, size)
    else
      render_fake_course_image(course, size)
    end
  end

  def render_fake_course_image(_course, size = :thumb)
    case size
    when :thumb
      image_tag("/course_place_holder_thumb.png")
    when :front
      image_tag("/course_place_holder.png")
    end
  end

  def render_real_course_image(course, size = :thumb)
    case size
    when :thumb
      image_tag(course.image.thumb)
    else
      image_tag(course.image.front)
    end
  end

  def render_course_price(course)
    "¥ #{course.price} RMB "
  end

  def render_course_one_sentence_summary(course)
    course.one_sentence_summary
  end

  def render_chapter_highlight_content(chapter, query_string)
    excerpt_cont = excerpt(chapter.chapter, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_post_article_highlight_content(post, query_string)
    excerpt_cont = excerpt(post.article, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end
end

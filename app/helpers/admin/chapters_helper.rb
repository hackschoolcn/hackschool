module Admin::ChaptersHelper
  def render_chapter_higher_priority_button(chapter)
    if chapter.first?
      link_to("上移", "#", class: "btn btn-xs btn-default disabled")
    else
      link_to("上移", higher_chapter_admin_course_chapter_path(@course, chapter), method: :post, class: "btn btn-xs btn-default")
    end
  end

  def render_chapter_lower_priority_button(chapter)
    if chapter.last?
      link_to("下移", "#", class: "btn btn-xs btn-default disabled")
    else
      link_to("下移", lower_chapter_admin_course_chapter_path(@course, chapter), method: :post, class: "btn btn-xs btn-default")
    end
  end

  def render_post_higher_priority_button(chapter, post)
    if post.first?
      link_to("上移", "#", class: "btn btn-xs btn-default disabled")
    else
      link_to("上移", higher_post_admin_chapter_post_path(chapter, post), method: :post, class: "btn btn-xs btn-default")
    end
  end

  def render_post_lower_priority_button(chapter, post)
    if post.last?
      link_to("下移", "#", class: "btn btn-xs btn-default disabled")
    else
      link_to("下移", lower_post_admin_chapter_post_path(chapter, post), method: :post, class: "btn btn-xs btn-default")
    end
  end
end

class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def show
    @chapter = Chapter.find(params[:chapter_id])
    @post = Post.find(params[:id])
    @course = @post.course

    set_breadcrumbs

    if @post.is_hidden? || @chapter.is_hidden?
      flash[:warning] = "The content is archived"
      redirect_to root_path
    end

    drop_breadcrumb @chapter.chapter
    drop_breadcrumb @post.title
  end

  def prev
    @post = Post.find(params[:id])
    course = @post.course

    post = @post.may_prev? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end

  def next
    @post = Post.find(params[:id])
    course = @post.course

    post = @post.may_next? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end

  protected

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to(@course.title, account_courses_path)]
  end

  def drop_breadcrumb(title = nil, url = nil)
    title ||= @page_title

    if title && url
      @breadcrumbs.push("<a href='#{url}'>#{title}</a>".html_safe)
    elsif title
      @breadcrumbs.push(title.to_s.html_safe)
    end
  end
end

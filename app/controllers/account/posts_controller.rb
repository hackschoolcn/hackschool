class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_enrollment_for_post

  def show
    @chapter = Chapter.find(params[:chapter_id])

    if @post.is_hidden? || @chapter.is_hidden?
      flash[:warning] = "The content is archived"
      redirect_to root_path
    end
  end

  def prev
    course = @post.course

    post = @post.may_prev? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end

  def next
    course = @post.course

    post = @post.may_next? || @post
    redirect_to account_chapter_post_path(post.chapter, post)
  end

  private

  def check_enrollment_for_post
    @post = Post.find(params[:id])
    course = @post.course

    if !current_user.enrolled_courses.include?(course)
      flash[:warning] = "请先报名参加该课程"
      redirect_to course_path(@course)
    end
  end

end

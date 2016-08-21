class Account::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def show
    @chapter = Chapter.find(params[:chapter_id])
    @post = Post.find(params[:id])

    if @post.is_hidden || @chapter.is_hidden
      flash[:warning] = "The content is archived"
      redirect_to root_path
    end
  end


  def prev
    @post = Post.find(params[:id])
    course = @post.course
    index = course.posts.find_index(@post)

    if index > 0

      index -= 1
      post = course.posts[index]
      while post.is_hidden && index > 0
        index -= 1
        post = course.posts[index]
      end

      if index < 1 && post.is_hidden          #检查是否找到最后都没找到已发布的
        redirect_to account_chapter_post_path(@post.chapter, @post)
      else
        redirect_to account_chapter_post_path(post.chapter, post)
      end
    end
    
  end


  def next
    @post = Post.find(params[:id])
    course = @post.course
    index = course.posts.find_index(@post)

    if index < course.posts.length - 1
      index += 1
      post = course.posts[index]
      while (post.chapter.is_hidden || post.is_hidden) && index < course.posts.length - 1
        index += 1
        post = course.posts[index]
      end

      if index > course.posts.length - 2 && post.is_hidden          #检查是否找到最后都没找到已发布的
        redirect_to account_chapter_post_path(@post.chapter, @post)
      else
        redirect_to account_chapter_post_path(post.chapter, post)
      end
    end

  end

end

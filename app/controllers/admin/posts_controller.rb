class Admin::PostsController < AdminController
  before_action :find_chapter, only: %i(index show new edit create update destroy)
  before_action :find_post, only: %i(edit show edit update destroy publish hide higher_post lower_post)

  def index
    @posts = @chapter.posts
  end

  def new
    @post = Post.new
  end

  def edit
    if params[:from_post_show]
      session[:from_post_show] = true
    end

    course = @chapter.course

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb "章节列表", admin_course_chapters_path(course)
    drop_breadcrumb @post.title
  end

  def show
    course = @chapter.course

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb "章节列表", admin_course_chapters_path(course)
    drop_breadcrumb @post.title
  end

  def create
    @post = Post.new(post_params)
    @course = @chapter.course
    @post.chapter = @chapter
    @post.course = @course
    if @post.save
      redirect_to admin_course_chapters_path(@course), notice: "创建成功"
    else
      render :new
    end
  end

  def update
    @course = @chapter.course
    
    if session[:from_post_show] # 根据记录回到原来的页面
      session[:from_post_show] = false

      if @post.update(post_params)
        redirect_to admin_chapter_post_path(@chapter, @post), notice: "更新成功"
      else
        render :edit
      end

    else

      if @post.update(post_params)
        redirect_to admin_course_chapters_path(@course), notice: "更新成功"
      else
        render :edit
      end

    end
  end

  def destroy
    @course = @chapter.course
    @post.destroy
    redirect_to admin_course_chapters_path(@course), alert: "Deleted"
  end

  def publish
    @post.publish!
    redirect_to :back
  end

  def hide
    @post.hide!
    redirect_to :back
  end

  def higher_post
    @post.move_higher
    redirect_to :back
  end

  def lower_post
    @post.move_lower
    redirect_to :back
  end


  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def post_params
    params.require(:post).permit(:title, :article)
  end
end

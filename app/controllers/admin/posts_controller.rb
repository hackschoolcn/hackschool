class Admin::PostsController < AdminController
  before_action :get_chapter_params, only: %i(index new edit create update destroy)
  before_action :find_params, only: [:edit, :show, :update, :destroy, :publish, :hide]

  def index
    @posts = @chapter.posts
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
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
    if @post.update(post_params)
      redirect_to admin_course_chapters_path(@course), notice: "更新成功"
    else
      render :edit
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

  private
  def find_params
    @post = Post.find(params[:id])
  end

  def get_chapter_params
    @chapter = Chapter.find(params[:chapter_id])
  end

  def post_params
    params.require(:post).permit(:title, :article)
  end
end

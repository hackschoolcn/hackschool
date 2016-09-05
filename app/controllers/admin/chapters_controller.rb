class Admin::ChaptersController < AdminController
  before_action :find_course, only: %i(index new edit create update destroy search)
  before_action :find_chapter, only: %i(edit show update destroy publish hide higher_chapter lower_chapter)
  before_action :validate_search_key, only: [:search]

  def index
    @chapters = @course.chapters

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb @course.title
  end

  def new
    @chapter = Chapter.new

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb "章节列表", admin_course_chapters_path(@course)
    drop_breadcrumb "新增 Chapter"
  end

  def edit

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb "章节列表", admin_course_chapters_path(@course)
    drop_breadcrumb @chapter.chapter
  end

  def show
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.course = @course
    if @chapter.save!
      redirect_to admin_course_chapters_path(@course), notice: "章节创建成功"
    else
      render :new
    end
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to admin_course_chapters_path(@course), notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to admin_course_chapters_path(@course), alert: "Deleted"
  end

  def publish
    @chapter.publish!
    redirect_to :back
  end

  def hide
    @chapter.hide!
    redirect_to :back
  end

  def higher_chapter
    @chapter.move_higher
    redirect_to :back
  end

  def lower_chapter
    @chapter.move_lower
    redirect_to :back
  end


  def search
    if @query_string.present?
      search_result = Post.where(course_id: params[:course_id]).ransack(@search_criteria).result(distinct: true)
      @posts = search_result.paginate(page: params[:page], per_page: 20)
    else
      redirect_to :back
    end
  end

  protected

  def validate_search_key
    @query_string = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { article_cont: query_string }
  end

  private

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def chapter_params
    params.require(:chapter).permit(:chapter)
  end
end

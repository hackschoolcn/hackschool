class Admin::ChaptersController < AdminController
  before_action :find_course, only: %i(index new edit create update destroy)
  before_action :validate_search_key, only: [:search]

  def index
    @chapters = @course.chapters

    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb @course.title, admin_course_chapters_path(@course)
  end

  def new
    @chapter = Chapter.new
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def show
    @chapter = Chapter.find(params[:id])
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
    @chapter = Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      redirect_to admin_course_chapters_path(@course), notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to  admin_course_chapters_path(@course), alert: "Deleted"
  end

  def publish
    @chapter = Chapter.find(params[:id])
    @chapter.publish!
    redirect_to :back
  end

  def hide
    @chapter = Chapter.find(params[:id])
    @chapter.hide!
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Post.ransack(@search_criteria).result(distinct: true)
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

  def find_course
    @course = Course.find(params[:course_id])
  end

  def chapter_params
    params.require(:chapter).permit(:chapter)
  end
end

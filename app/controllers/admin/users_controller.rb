class Admin::UsersController < AdminController
  before_action :find_user, only: %i(show edit update turn_to_admin turn_to_user)

  def index
    @users = User.all
  end

  def show
    drop_breadcrumb "Users", admin_users_path
  end

  def edit
    drop_breadcrumb "Users", admin_users_path
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "资料已更新！"
    else
      render :edit
    end
  end

  def user_paid
    @users = User.all
  end

  def user_works
    @course = Course.find(params[:course_id])
    @user = User.find(params[:id])
    @submitted_works = @user.works.where(course_id: @course.id)
    @unsolved_tasks = []

    @course.tasks.each do |task|  # 用户未完成的任务
      work = task.works.where(user_id: @user.id)
      if task.works.where(user_id: @user.id).count < 1
        @unsolved_tasks << task
      end
    end
    drop_breadcrumb "Courses", admin_courses_path
    drop_breadcrumb "#{@user.email} 课程作业 - #{@course.title}"
  end


  def turn_to_admin
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def turn_to_user
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:alert] = "用户 #{@user.email} 已被删除"
    redirect_to :back
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :selfintroduction, :address, :gender, :avatar)
  end
end

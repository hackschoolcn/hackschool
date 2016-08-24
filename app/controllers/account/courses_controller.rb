class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_search_key, only:[:search]
  layout "user"


  def index
    @courses = current_user.enrolled_courses
  end

  def enroll_course
    @course = Course.find(params[:id])

    if current_user.member_expire_date
      if !current_user.member_of?(@course)
        current_user.enroll_course!(@course)
        flash[:notice] = "报名成功"
      else
        flash[:warning] = "您已报名该课程"
      end

      redirect_to account_courses_path
      
    else
      create_order(price: @course.price, description: @course.id.to_s)
      redirect_to account_orders_path
    end
    
  end


  def search
    if @query_string.present?
      search_result = Course.where(:is_hidden => false).ransack(@search_criteria).result(distinct: true)
      @courses = search_result.paginate(page: params[:page], per_page:20)
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
    { title_or_description_or_answers_content_cont: query_string }
  end


  private

  def create_order(options = {})
    if current_user.orders.count > 0 && current_user.orders.last.unpaid?

      flash[:warning] = "您有已创建的订单还未付款，可以继续操作付款，或取消订单重新选择"

    else
      @order = Order.new
      @order.price = options[:price]
      @order.description = options[:description]
      @order.user = current_user
      @order.save

      flash[:notice] = "订单已创建"
    end
  end

end

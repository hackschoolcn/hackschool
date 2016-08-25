class Account::OrdersController < AccountController
  before_action :find_order, only: %i(pay_with_wechat pay_with_alipay cancel_order)
  before_action :check_order_may_pay, only: %i(pay_with_wechat pay_with_alipay)

  def index
    @orders = current_user.orders.recent
    drop_breadcrumb "我的课程", account_courses_path
  end

  def yearly_subscription
    @order = Order.new
    @order.price = 6000
    @order.subscription_months = 12
    @order.user = current_user
    @order.order_type = "subscription"
    @order.save

    flash[:notice] = "订单已创建"

    redirect_to account_orders_path
  end

  def yearly_subscription_from_course_view
    @course = Course.find(params[:course_id])

    @order = Order.new
    @order.price = 6000
    @order.subscription_months = 12
    @order.user = current_user
    @order.course = @course
    @order.order_type = "subscription"
    @order.save

    flash[:notice] = "订单已创建"

    redirect_to account_orders_path
  end

  def single_purchase
    
    @course = Course.find(params[:course_id])

    if @course.is_hidden?  # check_course_valid
      redirect_to root_path, notice: "该课程没有开课"
    else
      if current_user.member_of?(@course) # check encrolled_course uniq
        redirect_to account_courses_path, warning: "您已参加课程中"
      else
        @order = Order.new
        @order.price = @course.price
        @order.user = current_user
        @order.order_type = "single_purchase"
        @order.course = @course
        @order.save

        flash[:notice] = "订单已创建"

        redirect_to account_orders_path
      end
   end
  end

  def pay_with_wechat
    @order.pay("wechat")

    case @order.order_type
    when "subscription"
      current_user.add_subscription_date!(@order.subscription_months)
      current_user.enroll_course!(@order.course) if @order.course
    when "single_purchase"
      current_user.enroll_course!(@order.course)
    end

    redirect_to :back
  end

  def pay_with_alipay
    @order.pay("alipay")

    case @order.order_type
    when "subscription"
      current_user.add_subscription_date!(@order.subscription_months)
      current_user.enroll_course!(@order.course) if @order.course
    when "single_purchase"
      current_user.enroll_course!(@order.course)
    end

    redirect_to :back
  end

  def cancel_order
    if @order.may_cancel_order?
      @order.cancel_order!
    else
      flash[:warning] = "已付款的订单无法取消"
    end
    redirect_to :back
  end

  private

  def check_order_may_pay
    unless @order.may_make_payment?
      flash[:warning] = "该订单已付款"
      redirect_to account_orders_path
    end
  end

  def find_order
    @order = Order.find_by_token(params[:id])
  end
end

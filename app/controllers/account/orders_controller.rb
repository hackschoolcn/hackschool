class Account::OrdersController < AccountController
  before_action :find_order, only: %i(pay_with_wechat pay_with_alipay cancel_order)
  before_action :check_order_may_pay, only: %i(pay_with_wechat pay_with_alipay)


  def index
    @orders = current_user.orders.recent
    drop_breadcrumb "我的订单", account_orders_path

    set_page_title "我的订单"
    render layout: "user"
  end

  def show
    @order = Order.find_by_token(params[:id])
    render layout: "order_details"
  end

  def yearly_subscription
    create_order(months: 12, price: 6000, order_type: "subscription")
  end

  def yearly_subscription_from_course_view
    @course = Course.find(params[:course_id])

    if @course.hidden? || @course.dismissed? # check_course_valid
      flash[:warning] = "该课程没有开课"
      redirect_to root_path
      return
    end

    create_order(months: 12, price: 6000, order_type: "subscription", course: @course)
  end

  def single_purchase
    @course = Course.find(params[:course_id])

    if @course.hidden? || @course.dismissed? # check_course_valid
      flash[:warning] = "该课程没有开课"
      redirect_to root_path
      return
    elsif current_user.valid_subscriber?
      flash[:notice] = "您是年费会员，可以免费报名，不必单独购买此课程"
      redirect_to course_path(@course)
      return
    elsif current_user.member_of?(@course) # check encrolled_course uniq
      flash[:notice] = "您已参加课程中"
      redirect_to account_courses_path
      return
    end

    create_order(price: @course.price, order_type: "single_purchase", course: @course)
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

    flash[:notice] = "支付成功！"
    redirect_to account_orders_path
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

    flash[:notice] = "支付成功！"
    redirect_to account_orders_path
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

  def create_order(options = {})
    if current_user.orders.count.positive? && current_user.orders.last.unpaid?
      flash[:warning] = "您有已创建的订单还未付款，可以继续操作付款，或取消订单重新选择"
      redirect_to account_orders_path
    else
      @order = Order.new
      @order.price = options[:price]
      @order.order_type = options[:order_type]
      @order.subscription_months = options[:months]
      @order.course = options[:course]
      @order.user = current_user
      @order.save
      flash[:notice] = "订单已创建"
      redirect_to account_order_path(@order.token)
    end
  end

  def order_params
    params.require(:order).permit(:price, :token, :payment_method, :created_at, :aasm_state, :subscription_months, :order_type)
  end

end

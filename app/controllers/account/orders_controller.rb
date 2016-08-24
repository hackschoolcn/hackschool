class Account::OrdersController < AccountController
  before_action :get_order_params, only: %i(pay_with_wechat pay_with_alipay cancel_order)

  def index
    @orders = current_user.orders.recent
    drop_breadcrumb "我的课程", account_courses_path
  end

  def quarterly_subscription
    create_order(price: 2000, months: 3)
  end

  def yearly_subscription
    create_order(price: 6000, months: 12)
  end

  def pay_with_wechat
    if @order.may_make_payment?
      @order.pay("wechat")
      current_user.add_subscription_date!(@order.subscription_months)

    else
      flash[:warning] = "该订单已付款"

    end
    redirect_to :back
  end

  def pay_with_alipay
    if @order.may_make_payment?
      @order.pay("alipay")
      current_user.add_subscription_date!(@order.subscription_months)

    else
      flash[:warning] = "该订单已付款"

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

  def get_order_params
    @order = Order.find_by_token(params[:id])
  end

  def create_order(options = {})
    if current_user.orders.count.positive? && current_user.orders.last.unpaid?

      flash[:warning] = "您有已创建的订单还未付款，可以继续操作付款，或取消订单重新选择"

    else
      @order = Order.new
      @order.price = options[:price]
      @order.subscription_months = options[:months]
      @order.user = current_user
      @order.save

      flash[:notice] = "订单已创建"

    end

    redirect_to account_orders_path
  end
end

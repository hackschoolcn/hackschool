class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_params, only: %i(pay_with_wechat pay_with_alipay cancel_order)
  layout "user"

  def index
    @orders = current_user.orders.all.recent
  end

  def yearly_subscription
    create_order(months: 12, price: 6000, description: "year")
  end

  def pay_with_wechat
    pay_action("wechat")

    redirect_to :back
  end

  def pay_with_alipay
    pay_action("alipay")
    
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

  def pay_action(pay_method)

    if @order.may_make_payment?
      @order.pay(pay_method)
      current_user.add_subscription_date!(@order.subscription_months)

      unless @order.description == "year"
        course_id = @order.description.to_i
        course = Course.find(course_id)
        current_user.enroll_course!(course)
      end

    else
      flash[:warning] = "该订单已付款"
    end
    
  end

  def create_order(options = {})
    if current_user.orders.count > 0 && current_user.orders.last.unpaid?

      flash[:warning] = "您有已创建的订单还未付款，可以继续操作付款，或取消订单重新选择"

    else
      @order = Order.new
      @order.price = options[:price]
      @order.description = options[:description]
      @order.subscription_months = options[:months]
      @order.user = current_user
      @order.save

      flash[:notice] = "订单已创建"

    end

    redirect_to account_orders_path
  end

end

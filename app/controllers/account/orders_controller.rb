class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: %i(pay_with_wechat pay_with_alipay cancel_order)
  before_action :check_order_may_pay, only: %i(pay_with_wechat pay_with_alipay)
  layout "user"

  def index
    @orders = current_user.orders.all.recent
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

  def single_purchase
    # TODO : check_course_valid
    @course = Course.find(params[:course_id])

    @order = Order.new
    @order.price = @course.price
    @order.user = current_user
    @order.order_type = "single_purchase"
    @order.course = @course
    @order.save

    flash[:notice] = "订单已创建"

    redirect_to account_orders_path
  end

  def pay_with_wechat
    @order.pay("wechat")

    case @order.order_type
    when "subscription"

      current_user.add_subscription_date!(@order.subscription_months)
    when "single_purchase"
      current_user.enrolled_courses << @order.course
      # TODO: need to check uniq
    end

    redirect_to :back
  end

  def pay_with_alipay
    @order.pay("wechat")

    case @order.order_type
    when "subscription"
      @order.pay("alipay")
      current_user.add_subscription_date!(@order.subscription_months)
    when "single_purchase"
      current_user.enrolled_courses << @order.course
      # TODO: need to check uniq

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

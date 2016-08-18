class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_params, only: [:pay_with_wechat, :pay_with_alipay, :cancel_order]
  layout 'user'

  def index
    @orders = current_user.orders.all
  end

  def quarterly_subscription
    @order = Order.new
    @order.price = 2000
    @order.user = current_user
    @order.save

    flash[:notice] = '订单已创建'

    redirect_to account_orders_path
  end

  def yearly_subscription
    @order = Order.new
    @order.price = 6000
    @order.user = current_user
    @order.save

    flash[:notice] = '订单已创建'

    redirect_to account_orders_path
  end

  def pay_with_wechat
    if @order.may_make_payment?
      @order.pay('wechat')

      redirect_to :back
    else
      flash[:warning] = '该订单已付款'
      redirect_to :back
    end
  end

  def pay_with_alipay
    if @order.may_make_payment?
      @order.pay('alipay')

      redirect_to :back
    else
      flash[:warning] = '该订单已付款'
      redirect_to :back
    end
  end

  def cancel_order
    if @order.may_cancel_order?
      @order.cancel_order!
      redirect_to :back
    else
      flash[:warning] = '已付款的订单无法取消'
      redirect_to :back
    end
  end

  private

  def get_order_params
    @order = Order.find_by_token(params[:id])
  end
end

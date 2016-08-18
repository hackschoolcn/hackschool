class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_params, only: [:pay_with_wechat, :pay_with_alipay, :cancel_order]
  layout 'user'

  def index
    @orders = current_user.orders.all
  end

  def quarterly_subscription
    service_info = { price: 2000, title: '季票', description: '三个月套餐' }

    create_order_with_service(service_info)
  end

  def yearly_subscription
    service_info = { price: 6000, title: '年票', description: '全年套餐' }

    create_order_with_service(service_info)
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

  def create_order_with_service(_service_info = {})
    @order = Order.new
    @order.user = current_user

    if @order.save
      redirect_to account_orders_path, notice: '订单已创建'
    else
      redirect_to root_path, alert: '订单创建失败，请刷新再试'
    end
  end
end

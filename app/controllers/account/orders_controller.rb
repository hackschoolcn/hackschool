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

      @service.status = '已激活'
      @service.order_date = Time.current
      if @service.price > 2000
        @service.due_date = @service.order_date.advance(years: 1)
      else
        @service.due_date = @service.order_date.advance(months: 3)
      end
      @service.save

      redirect_to :back
    else
      flash[:warning] = '该订单已付款'
      redirect_to :back
    end
  end

  def pay_with_alipay
    if @order.may_make_payment?
      @order.pay('alipay')

      @service.status = '已激活'
      @service.order_date = Time.current
      if @service.price > 2000
        @service.due_date = @service.order_date.advance(years: 1)
      else
        @service.due_date = @service.order_date.advance(months: 3)
      end
      @service.save

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
    @service = @order.service
  end

  def create_order_with_service(service_info = {})
    @service = Service.new
    @service.price = service_info[:price]
    @service.title = service_info[:title]
    @service.description = service_info[:description]
    @service.status = '未激活'
    @service.user = current_user

    @order = Order.new
    @order.user = current_user
    @order.amount = @service.price
    @order.service = @service

    if @order.save && @service.save
      redirect_to user_orders_path, notice: '订单已创建'
    else
      redirect_to root_path, alert: '订单创建失败，请刷新再试'
    end
  end
end

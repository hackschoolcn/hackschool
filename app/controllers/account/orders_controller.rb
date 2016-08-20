class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_order_params, only: [:pay_with_wechat, :pay_with_alipay, :cancel_order]
  layout 'user'

  def index
    @orders = current_user.orders.all
  end

  def quarterly_subscription
    create_subscription_order({price: 2000, months: 3})
  end

  def yearly_subscription
    create_subscription_order({price: 6000, months: 12})
  end

  def pay_with_wechat
    if @order.may_make_payment?
      @order.pay('wechat')
      current_user.add_subscription_date!(@order.subscription_months)

      redirect_to :back
    else
      flash[:warning] = '该订单已付款'
      redirect_to :back
    end
  end

  def pay_with_alipay
    if @order.may_make_payment?
      @order.pay('alipay')
      current_user.add_subscription_date!(@order.subscription_months)

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


  def create_subscription_order(options={})

    if current_user.orders.count > 0 && current_user.orders.last.unpaid?

      flash[:warning] = '您有已创建的订单还未付款，可以继续付款操作，或取消订单'

      redirect_to account_orders_path
    else
      @order = Order.new
      @order.price = options[:price]
      @order.subscription_months = options[:months]
      @order.user = current_user
      @order.save

      flash[:notice] = '订单已创建'

      redirect_to account_orders_path
    end
    
  end

end

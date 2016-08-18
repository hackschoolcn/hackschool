module Account::OrdersHelper
  def render_order_payment_part_in_user_panel(order)
    if order.unpaid?
      content_tag :td do
        concat link_to('微信付款', pay_with_wechat_account_order_path(order.token), method: :post, class: 'btn btnsm btnsuccess')
        concat link_to('支付宝付款', pay_with_alipay_account_order_path(order.token), method: :post, class: 'btn btnsm btninfo')
        concat link_to('取消订单', cancel_order_account_order_path(order.token), method: :post, class: 'btn btndefault btnsm')
      end

    else
      content_tag :td do
        link_to('查看', '#', class: 'btn btndefault btnsm')
      end
    end
  end
end

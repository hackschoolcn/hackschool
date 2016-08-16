module User::OrdersHelper

  def render_order_payment_part_in_user_panel(order)

    if order.unpaid?
      content_tag :td do
        concat link_to("微信付款", pay_with_wechat_user_order_path(order.token), method: :post, class: "btn btn-sm btn-success")
        concat link_to("支付宝付款", pay_with_alipay_user_order_path(order.token), method: :post, class: "btn btn-sm btn-info")
        concat link_to("取消订单", cancel_order_user_order_path(order.token), method: :post, class: "btn btn-default btn-sm")
      end
      
    else
      content_tag :td do
        link_to("查看", "#", class: "btn btn-default btn-sm")
      end
    end

  end
end

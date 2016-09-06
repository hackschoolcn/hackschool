module Account::OrdersHelper
  def render_order_payment_part_in_user_panel(order)
    render partial: "payment_options", locals: { order: order }
  end

  def render_order_description(order)
    if order.order_type == "subscription"
      "年费会员"
    else
      order.course.title
    end
  end
end

module Account::OrdersHelper
  def render_order_payment_part_in_user_panel(order)
    render partial: "payment_options", locals: { order: order }
  end

  def render_order_description(order)
    if order.description == "year"
      "订阅年费会员"
    else
      course_id = order.description.to_i
      course = Course.find(course_id)
      "购买课程：【#{course.title}】"
    end
  end
end

module Account::OrdersHelper
  def render_order_payment_part_in_user_panel(order)
    render partial: "payment_options", locals: { order: order }
  end
end

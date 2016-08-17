# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  amount         :float            default(0.0)
#  user_id        :integer
#  token          :string
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  aasm_state     :string           default("unpaid")
#

class Order < ApplicationRecord
  after_create :generate_token
  include AASM

  belongs_to :user
  has_one :service, dependent: :destroy

  aasm do
    state :unpaid, initial: true
    state :paid
    state :order_cancelled

    event :make_payment do
      transitions from: :unpaid, to: :paid
    end

    event :cancel_order do
      transitions from: :unpaid, to: :order_cancelled
    end

  end

  def pay(pay_way)
    self.payment_method = pay_way
    self.make_payment!

    self.save
  end

  private

  def generate_token
    self.token = SecureRandom.uuid
    self.save
  end

end

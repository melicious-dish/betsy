class Order < ApplicationRecord
  # QUESTION: does this cover the entirety of the "must have one or many"??
  has_many :order_items

  # QUESTION: add all the billing info like cc?
  # QUESTION: date_time_placed --> redundant b/c of created_at time stamp??
  # QUESTION: fulfillment_status --> check to make sure that statuses are one of the allowed ones (ex: pending, completed, paid, etc.)
  # QUESTION: clear_cart default value? true vs false?
  # QUESTION: total_price --> has to come from the sum of all the order_items via products.... (also needs to be int)
  # QUESTION: should not put order_item id down b/c it could then take many (ex: koolaid, nailpolish, etc.)

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end

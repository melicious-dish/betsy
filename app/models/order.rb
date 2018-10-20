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
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum

    #products.collect { |p| p.valid? ? (p.price * )}
  end
  private
  def set_fullfillment_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end

# The set_order_status gets fired when the order is created and sets the fullfillment_status_id column to 1 (in progress). The update_subtotal function is called during save and sums up our order item's total cost and stores it in the subtotal field. The subtotal function actually overrides the field named subtotal, so calling order.subtotal calls the function. You can still access the field internally by calling self[:subtotal], so we use that to update the field. This allows us to dynamically update subtotal as needed. A side effect of this is user can't write any arbitrary value to the subtotal field.

class Order < ApplicationRecord
  # TODO: decide/add more validations+testing (cc info, mailing address, etc)
  has_many :order_items


  # QUESTION: fulfillment_status --> check to make sure that statuses are one of the allowed ones (ex: pending, completed, paid, etc.)


  def empty_cart?()
    return self.order_items.nil? || self.order_items.empty?
  end

  def order_total()
    total_as_float = self.order_items.sum do |order_item|
      order_item.order_item_subtotal()
    end

    return total_as_float
  end

  # if guest has submitted an order, then we start a new cart tied to a new session id
  # def self.create_new_cart_upon_submit()
  #   new_order = Order.create()
  #   return new_order
  # end
  #
  # def self.set_new_session_order_id()
  #   new_order = create_new_cart_upon_submit()
  #   session[:order_id] = new_order.id
  # end


  private
  # QUESTION: what does this do? is this old?
  # def set_fullfillment_status
  #   self.order_status_id = 1
  # end

end

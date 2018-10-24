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


  private
  # QUESTION: what does this do? is this old?
  # def set_fullfillment_status
  #   self.order_status_id = 1
  # end

end

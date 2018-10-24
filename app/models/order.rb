class Order < ApplicationRecord
  # TODO: decide/add more validations+testing (cc info, mailing address, etc)
  has_many :order_items


  # QUESTION: fulfillment_status --> check to make sure that statuses are one of the allowed ones (ex: pending, completed, paid, etc.)


  def order_total()
    total = self.order_items.sum do |order_item|
      order_item.order_item_subtotal()
    end

    return total
  end


  private
  # QUESTION: what does this do? is this old?
  # def set_fullfillment_status
  #   self.order_status_id = 1
  # end

end

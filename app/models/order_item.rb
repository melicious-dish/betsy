class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }


  # TODO: change from true/false to pending etc. [this will cause errors i think until we can coordinate it]
  validates :shipped, inclusion: { in: [true, false] }

  def order_item_subtotal()
    price = convert_int_to_f(self.product.price)
    quantity = self.quantity

    return price * quantity
  end

end

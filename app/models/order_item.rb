class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

<<<<<<< HEAD
  # validate :product_present
  # validate :order_present
=======
  # TODO: change from true/false to pending etc. [this will cause errors i think until we can coordinate it]
  validates :shipped, inclusion: { in: [true, false] }
>>>>>>> fd59ac9934c35fe77e79cbbc6d9279fe3d84aa22

  # NOTE: <MC> The two lines below made the model tests fail </MC>
  # validate :product_present
  # validate :order_present

  def self.add_order_item_to_order(order_item)
    if order_item.order_id.nil? || order_item.order_id.empty?
      new_order = Order.new()
      return new_order.id

    elsif
      ongoing_order = Order.find_by(id: order_item.order_id)
      return ongoing_order.id
    else
      # TODO: what if not found?
      puts "oh no"
    end
  end


  # def total_price
  # end


end

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  # validate :product_present
  # validate :order_present

  # QUESTION: add shipment? column: "Link to transition the order item to marked as shipped"

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

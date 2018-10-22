class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  validate :product_present
  validate :order_present

  # QUESTION: add shipment? column: "Link to transition the order item to marked as shipped"



  # def total_price
  # end


end

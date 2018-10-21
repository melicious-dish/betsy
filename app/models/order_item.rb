class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  validate :product_present
  validate :order_present

  before_save :finalize
  # QUESTION: add shipment? column: "Link to transition the order item to marked as shipped"



  # def total_price
  #   unit_price * quantity
  # end

 # def subtotal
 #   subtotal = 0
 #   self.products.each do |p|
 #     subtotal += p.price
 #   end
 #   return subtotal
 # end



  private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end

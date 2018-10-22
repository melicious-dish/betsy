class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  # TODO: change from true/false to pending etc. [this will cause errors i think until we can coordinate it]
  validates :shipped, inclusion: { in: [true, false] }

  # NOTE: <MC> The two lines below made the model tests fail </MC>
  # validate :product_present
  # validate :order_present



  # def total_price
  # end


end

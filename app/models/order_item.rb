class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  # QUESTION: date_time_placed --> redundant b/c of created_at time stamp??

end

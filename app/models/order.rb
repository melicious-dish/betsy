class Order < ApplicationRecord
  # QUESTION: does this cover the entirety of the "must have one or many"??
  has_many :order_items
end

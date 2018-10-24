class Product < ApplicationRecord
  has_many :reviews
  has_many :order_items
  belongs_to :merchant
  has_and_belongs_to_many :categories

  validates :name, presence: true, uniqueness: true
  # TODO: maybe product name must be unique to category???
  validates :price, presence: true, numericality: { greater_than: 0 }

  # Deleted/inactive products aren't shown
  default_scope { where(status: true) }



  # QUESTION: how to handle invalid photo URLS since that will 'show up' ??
  # QUESTION: status default --> true?? to show it's automatically active?



  def price_int_to_float()
    return convert_int_to_f(self.price)
  end



end

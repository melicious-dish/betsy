class Product < ApplicationRecord
  has_many :reviews
  has_many :order_items
  belongs_to :merchant
  has_and_belongs_to_many :categories

  validates :name, presence: true, uniqueness: true
  # TODO: maybe product name must be unique to category???
  validates :price, presence: true, numericality: { greater_than: 0 }
  # QUESTION: user will likely input a float --> so we will need to change it into an int b/c it'll be stored as an int in the db
  # QUESTION: how to handle invalid photo URLS since that will 'show up' ??
end

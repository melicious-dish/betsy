require "test_helper"
# has_many :reviews
# has_many :order_items
# belongs_to :merchant
# has_and_belongs_to_many :categories

# validates :name, presence: true, uniqueness: true
# # TODO: maybe product name must be unique to category???
# validates :price, presence: true, numericality: { greater_than: 0 }

describe Product do
  let(:product) { Product.new }

  it "must be valid" do
    skip
    value(product).must_be :valid?
  end
end

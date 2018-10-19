require "test_helper"

describe Order do
  let(:order) { Order.new }

  it "must be valid" do
    skip
    value(order).must_be :valid?
  end
end

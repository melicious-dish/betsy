require "test_helper"

describe Order do
  let(:order) { Order.new }
  let(:order1) { orders(:order1) }

  describe 'relations' do
    it 'has many order items' do
      expect(order1).must_respond_to :order_items

      order1.order_items.each do |order_item|
        expect(order_item).must_be_kind_of OrderItem
      end

      order1.order_items.each do |order_item|
        expect(order_item).must_equal order_items(:orderitem1)
      end
    end
  end

  # TODO: decide/add more validations+testing (cc info, mailing address, etc)
  describe 'validations' do
    it "must be valid" do
      value(order).must_be :valid?
    end
  end
end

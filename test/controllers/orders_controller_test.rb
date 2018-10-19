require "test_helper"

describe OrdersController do

  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "can create a product" do
    product_hash = {
      product: {
        name: 'Practical Object Oriented Programming in Ruby',
        price: 20,
        description: 'A look at how to design object-oriented systems',
        photo_url: 'test url',
        status: true,
        inventory: 1
      }
    }

    expect {
      post products_path, params: product_hash
    }.must_change 'Product.count', 1

    must_respond_with  :redirect

    expect(Product.last.name).must_equal product_hash[:product][:name]
    expect(Product.last.price).must_equal product_hash[:product][:price]
    expect(Product.last.description).must_equal product_hash[:product][:description]
  end


  it "will not create a product with invalid params" do
    product_hash = {
      product: {
        name: 'Practical Object Oriented Programming in Ruby',
        price: 20,
        description: 'A look at how to design object-oriented systems',
        photo_url: 'test url',
        status: "test string not boolean",
        inventory: 1
      }
    }

    expect {
      post products_path, params: product_hash
    }.wont_change 'Product.count'

    must_respond_with :bad_request
  end
  
end

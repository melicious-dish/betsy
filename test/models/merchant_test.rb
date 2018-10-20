require "test_helper"

describe Merchant do
  let(:merchant) { Merchant.new }
  let(:mercury) { merchants(:mercury) }

  describe 'relations' do
    it 'has a list of products' do
      expect(mercury).must_respond_to :products

      mercury.products.each do |product|
        expect(product).must_be_kind_of Product
      end
    end
  end

  describe 'validations' do
    it "must be valid" do
      value(mercury).must_be :valid?
    end

    it 'requires a username present' do
      mercury.username = nil

      expect(mercury.valid?).must_equal false
      expect(mercury.errors.messages).must_include :username

      mercury.username = "merch"
      expect(mercury.valid?).must_equal true
    end

    it 'requires a unique username' do
      mars = merchants(:mars)
      saturn = merchants(:saturn)
      saturn.username = "mars"

      expect(saturn.valid?).must_equal false
      expect(saturn.errors.messages).must_include :username
    end

    it 'requires an email address present' do
      mercury.email = nil

      expect(mercury.valid?).must_equal false
      expect(mercury.errors.messages).must_include :email
    end

    it 'requires a unique email address' do
      mars = merchants(:mars)
      saturn = merchants(:saturn)
      mars.email = "hello@hello.com"
      saturn.email = "hello@hello.com"
      mars.save
      saturn.save

      expect(saturn.valid?).must_equal false
      expect(saturn.errors.messages).must_include :email
    end
  end

  describe 'model logic' do
    # TODO: add tests for business logic below
  end
end

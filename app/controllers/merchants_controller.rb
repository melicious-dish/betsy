class MerchantsController < ApplicationController
  def index
    @merchant = Merchant.all
  end

  def show
    # QUESTION: add if/else so only login_user can view merchant account page??
    @merchant = Merchant.find(params[:id])
    render_404 unless @merchant
  end

  def order_summary
    puts params[:merchant_id]
    @orders = Order.joins(:products).where(products: {merchant_id: params[:merchant_id]})
  end


end

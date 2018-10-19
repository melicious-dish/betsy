class MerchantsController < ApplicationController
  def index
    @merchant = Merchant.all
  end

  def show
    # QUESTION: add if/else so only login_user can view merchant account page??
    @merchant = Merchant.find_by(id: params[:id])
    render_404 unless @merchant
  end


end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_merchant

  def render_404
    # DPR: this will actually render a 404 page in production
    raise ActionController::RoutingError.new('Not Found')
  end

private
  def find_merchant
    if session[:username]
      @login_user = Merchant.find_by(id: session[:username])
    end
  end
end

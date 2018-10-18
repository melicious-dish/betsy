class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github')

    if merchant
      flash[:success] = "Logged in as merchant #{merchant.username}"

    else
      merchant = Merchant.build_from_github(auth_hash)
      if merchant.save
        flash[:success] = "Logged in as new merchant #{merchant.username}"
      else
        flash[:error] = "Could not create new user account: #{merchant.errors.messages}"
        redirect_to root_path
        return
      end
      session[:username] = merchant.id
      redirect_to root_path
    end

    def destroy
    session[:username] = nil
    flash[:status] = :success
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end
end

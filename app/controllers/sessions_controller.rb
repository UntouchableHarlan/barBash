class SessionsController < ApplicationController
  def new
  end

  def create
    @owner = Owner.find([:session][:email])
    if @owner && @owner.authenticate([:session][:password])
      session[:owner_id] = @owner.id
      redirect_to root_path
    else
      redirect_to login_path
  end

  def destroy
    seession[:owner_id] = nil
    redirect_to root_path
  end
end

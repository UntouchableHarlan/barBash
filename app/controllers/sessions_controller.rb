class SessionsController < ApplicationController
  
  def new

  end
  def create
    @owner = Owner.find_by_email(params[:session][:email])
    if @owner && @owner.authenticate(params[:session][:password])
      session[:owner_id] = @owner.id
      current_owner
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end

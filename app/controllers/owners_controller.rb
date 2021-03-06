class OwnersController < ApplicationController
before_action :set_bar, only: [:create, :edit]
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to drinks_path
    else
      render 'new'
    end
  end

  private

  def owner_params
    params.require(:owner).permit([:name, :email, :password, :password_confirmation])
  end
end

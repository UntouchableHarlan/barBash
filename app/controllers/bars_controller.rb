class BarsController < ApplicationController
  def editpage
    @bar = Bar.find(3)
  end
  def edit
    Bar.find(3).update(capacity: params[:capacity], people_inside: params[:people_inside])
    redirect_to bars_edit_path
  end
end

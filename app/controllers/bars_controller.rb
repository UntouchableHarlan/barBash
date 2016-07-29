class BarsController < ApplicationController
  def editpage
    @bar = Bar.all[0]
  end
  def edit
    Bar.all[0].update(capacity: params[:capacity], people_inside: params[:people_inside])
    redirect_to bars_edit_path
  end
end

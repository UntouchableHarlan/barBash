class BarsController < ApplicationController

  def edit
    @bar = Bar.find(3)
  end
end

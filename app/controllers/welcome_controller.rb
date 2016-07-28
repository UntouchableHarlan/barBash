class WelcomeController < ApplicationController
  def home

    new_price
    @drinks = Drink.all
  end
end

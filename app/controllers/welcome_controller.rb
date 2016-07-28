class WelcomeController < ApplicationController
  def home
    @drinks = Drink.all
  end
end

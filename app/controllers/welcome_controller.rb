class WelcomeController < ApplicationController
  def home
    @drink = Drink.find(rand(1..19))
  end
end

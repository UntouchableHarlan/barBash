class WelcomeController < ApplicationController
  def home
    @drink = Drink.find(rand(20..30))
  end
  def reload

  end

end

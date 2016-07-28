class WelcomeController < ApplicationController
  def home
# <<<<<<< HEAD
#     current_owner
# =======
    @drinks = Drink.all
# >>>>>>> 73099c4f0805b39a4f55040b3d3808775d52f2e3
  end
end

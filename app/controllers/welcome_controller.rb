class WelcomeController < ApplicationController
  def home
    current_owner
  end
end

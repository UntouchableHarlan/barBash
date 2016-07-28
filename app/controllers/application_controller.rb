class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
private
  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end
  def require_owner
    redirect_to login_path flash.now[:error] = "Could not save client" unless current_owner
  end
  def get_time
    session[:start_time] = Time.now.min

  end

  def new_price
    # get_time
    percent_of_capacity_full = 0.5
    drink_bought_in_last_5mins = 5
    if (Time.now.min - session[:start_time]) % 5 == 0
      Drink.all.each do |drink|
        drink.update(price: 0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
      end
    end
  end

  helper_method :current_owner
  helper_method :get_time
  helper_method :new_price
end

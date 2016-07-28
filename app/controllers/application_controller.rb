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
    get_time
    bar = Bar.find(3)
    # p  "*" * 50
    # p bar.capacity
    percent_of_capacity_full = (bar.people_inside.to_f / bar.capacity).round(2)
    # p  "*" * 50
    drink_bought_in_last_5mins = 5
    # if (Time.now.min - session[:start_time]) % 5 == 0
      Drink.all.each do |drink|
        drink.price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
        drink.price = drink.price.round(2)
        if drink.price > drink.max_price
          drink.price = drink.max_price
        elsif drink.price < drink.min_price
          drink.price = drink.min_price
        end
        drink.save
      # end
    end
  end

  helper_method :current_owner
  helper_method :get_time
  helper_method :new_price
end

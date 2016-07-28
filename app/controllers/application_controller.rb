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
    session[:start_time_min] = Time.now.min
    session[:start_time_hour] = Time.now.hour

  end

  def new_price
    get_time
    # Price.destroy_all
    bar = Bar.find(3)
    # Drink.all.each do |drink|
    #   Price.create(amount: drink.price, drink: drink)
    # end
    @price_minute = Price.all.last.created_at.min
    @price_hour = (Price.all.last.created_at.hour - 4)
    percent_of_capacity_full = (bar.people_inside.to_f / bar.capacity).round(2)
    drink_bought_in_last_5mins = 5
      if (Time.now.min - session[:start_time_min]) % 1 == 0
        Drink.all.each do |drink|
              if Time.now.hour == @price_hour && (Time.now.min) == @price_minute
                break
            end
          drink.price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
          drink.price = drink.price.round(2)
            if drink.price > drink.max_price
              drink.price = drink.max_price
            elsif drink.price < drink.min_price
              drink.price = drink.min_price
            end
          if drink.save
            Price.create(amount: drink.price, drink: drink)
          end
        end
      end
    end

    helper_method :current_owner
    helper_method :get_time
    helper_method :new_price
  end

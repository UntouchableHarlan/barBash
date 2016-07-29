class WelcomeController < ApplicationController
  def home
    new_price

    if session[:start_time_min].nil?
      get_time
    end
    @drinks = Drink.all
  end

  private
  def new_price
    # get_time
    # Price.destroy_all
    bar = Bar.all[0]
    # Drink.all.each do |drink|
    #   Price.create(amount: drink.price, drink: drink)
    # end
    @price_minute = Price.all.last.created_at.min
    @price_hour = Time.now.hour
    percent_of_capacity_full = (bar.people_inside.to_f / bar.capacity).round(2)
    drink_bought_in_last_5mins = 5
      # if (Time.now.min - session[:start_time_min]) % 1 == 0
        Drink.all.each do |drink|
      #         if Time.now.hour == @price_hour && (Time.now.min) == @price_minute
      #           break
      #       end
          @last_price = drink.current_price

      drink.current_price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
      drink.current_price = drink.current_price.round(2)
        if drink.current_price > drink.max_price
          drink.current_price = drink.max_price
        elsif drink.current_price < drink.min_price
                drink.current_price = drink.min_price
        end
        if drink.save
          Price.create(amount: drink.current_price, drink: drink)
            drink.update(price_difference: (drink.current_price - @last_price).round(2))

        end
      end
    end
    # end
end

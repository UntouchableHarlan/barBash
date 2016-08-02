class WelcomeController < ApplicationController

  def home


    # if session[:start_time_min].nil?
    # end
    # new_price
    type = params[:type]
    if type && type == "biggestchange"
      @drinks = Drink.all.sort{|a,b| (a.current_price - a.price) <=> (b.current_price - b.price)}.first(10)
    elsif type && !type.blank?
      @drinks = Drink.where(category: type)
    else
      @drinks = Drink.all.first(10)
    end
  end

  def create

  end
  # def get_time
  #   session[:start_time_min] = Time.now.min
  #   session[:start_time_hour] = Time.now.hour
  #   redirect_to root_path
  # end

  def beers
    beers = Drink.where(name: "beer").sort{|a,b| a.price_difference <=> b.price_difference}.first(10)
    render json: beers, status: 200
  end
  #post '/starttimer'
  # def set_timer
  #   @timer = params[:welcome][:time_in_seconds].to_i
  #   gon.timer = @timer
  #   p gon.timer
  # end
  def add_sale
    @drink = Drink.find_by(name: params["name"])
    p "*" * 50
    p @drink
    p "*" * 50
    Sale.create(price: params["price"].to_f, drink: @drink , quantity: 1)
    # redirect_to root_path
  end
  def update_prices
    Drink.all.each do |drink|
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

  private
  # def new_price
  #   # get_time
  #   # Price.destroy_all
  #   bar = Bar.all[0]
  #
  #   # Drink.all.each do |drink|
  #   #   Price.create(amount: drink.price, drink: drink)
  #   # end
  #   # @price_minute = Price.all.last.created_at.min
  #   # @price_hour = Time.now.hour
  #
  #   if Price.all.size == 0
  #     Drink.all.each do |drink|
  #       Price.create(amount: drink.price, drink: drink)
  #     end
  #   end
  #   # @timer_min = bar.timer
  #   @price_minute = Price.all.last.created_at.min
  #   @price_hour = Time.now.hour
  #
  #   percent_of_capacity_full = (bar.people_inside.to_f / bar.capacity).round(2)
  #   drink_bought_in_last_5mins = 5
  #     if (Time.now.min - session[:start_time_min]) % 5 == 0
  #       Drink.all.each do |drink|
  #             if Time.now.hour == @price_hour && (Time.now.min) == @price_minute
  #               break
  #           end
  #         @last_price = drink.current_price
  #
  #     drink.current_price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
  #     drink.current_price = drink.current_price.round(2)
  #       if drink.current_price > drink.max_price
  #         drink.current_price = drink.max_price
  #       elsif drink.current_price < drink.min_price
  #               drink.current_price = drink.min_price
  #       end
  #       if drink.save
  #         Price.create(amount: drink.current_price, drink: drink)
  #           drink.update(price_difference: (drink.current_price - @last_price).round(2))
  #
  #       end
  #     end
  #   end
  # end
end

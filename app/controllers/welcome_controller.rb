class WelcomeController < ApplicationController

  def home
    set_interval
    Bar.take.update(timer: 20) if Bar.take.timer.nil?
    new_day_data
    get_todays_drink_prices
    get_best_drink_prices
    sales_info
  end

  def add_timer
    Bar.take.update(timer: params[:timer])
  end

  def add_sale
    @drink = Drink.find_by(name: params["name"])
    Sale.create(price: params["price"].to_f, drink: @drink , quantity: 1)
  end

  def add_sales
    Drink.all.each do |drink|
      Sale.create(drink: drink, price: drink.current_price, quantity: rand(0..5))
    end
  end

  def updateprices
    if Price.all.size == 0
      Drink.all.each do |drink|
        Price.create(amount: drink.price, drink: drink)
      end
    end
    Drink.all.find_each do |drink|
      drink.update_drink_price
    end
  end

    def market_crash
      Drink.all.each do |drink|
        last_price = drink.current_price
        drink.current_price = drink.min_price
        drink.price_difference = drink.current_price - last_price
        drink.save
      end
    end

  private

  def best_price(drinks)
    drinks.sort{|a,b| (a.current_price - a.price) <=> (b.current_price - b.price)}.first(5)
  end

  def set_interval
    @interval = (Time.now.beginning_of_day..Time.now.end_of_day)
  end

  def prices_for_drink_today(table_name)
    Drink.where(table_name: table_name).includes(:prices).where(prices: { created_at: @interval })
  end

  def best_deal(category)
    best_price(Drink.where(category: category).includes(:prices).where(prices: { created_at: @interval }))
  end

  def add_up_sales(time_table)
    array = []
    Sale.where(created_at: time_table).each {|sale| array << sale.quantity}
    array.inject(0){|sum,x| sum + x }
  end

  def new_day_data
    if @drinks_prices_today.nil?
      Drink.all.each do |drink|
        drink.prices.create(amount: drink.price)
      end
    end
  end

  def get_todays_drink_prices
    @drinks_prices_today = Hash.new
    Drink.pluck(:table_name).uniq.each {|name|
      @drinks_prices_today[name] = prices_for_drink_today(name)
    }
  end

  def get_best_drink_prices
    @best_deal_shot = best_deal("shot")
    @best_deal_beer = best_deal("beer")
    @best_deal_cocktail = best_deal("cocktail")
    @best_deal = Drink.all.includes(:prices).where(prices: { created_at: @interval }).sort{ |a,b|
       (a.current_price - a.price) <=> (b.current_price - b.price)
     }.first(5)
  end

  def sales_info
    @total_sales_for_today = add_up_sales(@interval)
    @total_sales_for_last_timer = add_up_sales(Bar.take.timer.seconds.ago..Time.now)
  end
end

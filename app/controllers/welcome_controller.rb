class WelcomeController < ApplicationController

  def home
    # Bar.take.update(timer: 20)

      interval = (Time.now.beginning_of_day..Time.now.end_of_day)
      @tequila = Drink.where(table_name: "Tequila").includes(:prices).where(prices: { created_at: interval })
      @rum = Drink.where(table_name: "Rum").includes(:prices).where(prices: { created_at: interval })
      @whiskey = Drink.where(table_name: "Whiskey").includes(:prices).where(prices: { created_at: interval })
      @vodka = Drink.where(table_name: "Vodka").includes(:prices).where(prices: { created_at: interval })
      @domestic = Drink.where(table_name: "Domestic").includes(:prices).where(prices: { created_at: interval })
      @imported = Drink.where(table_name: "Imported").includes(:prices).where(prices: { created_at: interval })
      @brewery = Drink.where(table_name: "Wynwood Brewery").includes(:prices).where(prices: { created_at: interval })
      @wine = Drink.where(table_name: "Wine").includes(:prices).where(prices: { created_at: interval })
      @cocktail = Drink.where(table_name: "Cocktail").includes(:prices).where(prices: { created_at: interval })
      @best_deal = Drink.all.includes(:prices).where(prices: { created_at: interval }).sort{ |a,b|
        (a.current_price - a.price) <=> (b.current_price - b.price)
      }.first(5)
      @best_deal_shot = best_price(Drink.where(category: "shot").includes(:prices).where(prices: { created_at: interval }))
      @best_deal_beer = best_price(Drink.where(category: "beer").includes(:prices).where(prices: { created_at: interval }))
      @best_deal_cocktail = best_price(Drink.where(category: 'cocktail').includes(:prices).where(prices: { created_at: interval }))
      array = []
      Sale.where(created_at: interval).each {|sale| array << sale.quantity}
      @total_sales_for_today = array.inject(0){|sum,x| sum + x }
      array1 = []
      Sale.where(created_at: (Bar.take.timer.seconds.ago..Time.now)).each {|sale| array1 << sale.quantity}
      @total_sales_for_last_timer = array1.inject(0){|sum,x| sum + x }
      # @total_sales_for_last_timer =
      #if third page isn't loading with drinks run this function below and reload once it should fix it, if not reload one more time and you good :), gotta come back and actually fix this but this is a hack for now

      # Drink.all.each do |drink|
      #   drink.prices.create(amount: drink.price)
      # end
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
      bar = Bar.all[0]
      percent_of_capacity_full = 0.8
    Drink.all.find_each do |drink|
      array = []
       drink.sales.where(created_at: ((Bar.take.timer.seconds.ago)..Time.now)).each {|sale| array << sale.quantity}
      drink_bought_in_last_5mins = array.inject(0){|sum,x| sum + x }
      @last_price = drink.current_price
      drink.current_price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins))
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
  def best_price(drinks)
    drinks.sort{|a,b| (a.current_price - a.price) <=> (b.current_price - b.price)}.first(5)
  end

end

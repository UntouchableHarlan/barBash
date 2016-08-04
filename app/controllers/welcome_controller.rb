class WelcomeController < ApplicationController

  def home

      # @drinks = Drink.all
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
  end

  def add_sale
    @drink = Drink.find_by(name: params["name"])
    Sale.create(price: params["price"].to_f, drink: @drink , quantity: 1)
  end
  def updateprices
    if Price.all.size == 0
        Drink.all.each do |drink|
          Price.create(amount: drink.price, drink: drink)
        end
      end
      bar = Bar.all[0]
      percent_of_capacity_full = (bar.people_inside.to_f / bar.capacity).round(2)
      drink_bought_in_last_5mins = 5
    Drink.all.find_each do |drink|
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

  private
  def best_price(drinks)
    drinks.sort{|a,b| (a.current_price - a.price) <=> (b.current_price - b.price)}.first(5)
  end

end

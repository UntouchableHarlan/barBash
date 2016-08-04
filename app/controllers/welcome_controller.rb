class WelcomeController < ApplicationController

  def home
      @tequila = Drink.where(table_name: "Tequila")
      @rum = Drink.where(table_name: "Rum")
      @whiskey = Drink.where(table_name: "Whiskey")
      @vodka = Drink.where(table_name: "Vodka")
      @domestic = Drink.where(table_name: "Domestic")
      @imported = Drink.where(table_name: "Imported")
      @brewery = Drink.where(table_name: "Wynwood Brewery")
      @wine = Drink.where(table_name: "Wine")
      @cocktail = Drink.where(table_name: "Cocktail")
      @best_deal = Drink.all.sort{|a,b| (a.current_price - a.price) <=> (b.current_price - b.price)}.first(5)
      @best_deal_shot = best_price(Drink.where(category: "shot"))
      @best_deal_beer = best_price(Drink.where(category: "beer"))
      @best_deal_cocktail = best_price(Drink.where(category: 'cocktail'))
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
    Drink.all.each do |drink|
      drink.current_price = (0.077852 + (0.72179 * drink.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins) + rand(-0.5..0.5))
      drink.current_price = drink.current_price.round(2)
        if drink.current_price > drink.max_price
          drink.current_price = drink.max_price
        elsif drink.current_price < drink.min_price
                drink.current_price = drink.min_price
        end
        @last_price = drink.current_price
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

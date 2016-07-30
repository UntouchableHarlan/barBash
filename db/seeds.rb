# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Price.destroy_all
Drink.destroy_all
Bar.destroy_all
Owner.destroy_all
owner = Owner.create(name: "admin", email: "admin@admin.com", password: "asdf")

@bar = Bar.create(name: "Wood", owner: owner, capacity: 300, people_inside: 150, timer: 3)


  # bar.drinks.create(name: "tequila", brand: "conquistador", price: 3, quality: 1, max_price: 5, min_price:  1)
  # bar.drinks.create(name: "tequila", brand: "patron_silver", price: 4, quality: 3, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "tequila", brand: "patron_gold", price: 4, quality: 3, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "whiskey", brand: "makers_mark", price: 3, quality: 1, max_price: 5, min_price: 1)
  # bar.drinks.create(name: "whiskey", brand: "jameson", price: 4, quality: 2, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "whiskey", brand: "black_label", price: 5, quality: 2, max_price: 7, min_price: 3)
  # bar.drinks.create(name: "whiskey", brand: "blue_label", price: 7, quality: 3, max_price: 9, min_price: 5)
  # bar.drinks.create(name: "vodka", brand: "svedka", price: 3, quality: 1, max_price: 5, min_price: 2)
  # bar.drinks.create(name: "vodka", brand: "absolute", price: 4, quality: 2, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "vodka", brand: "grey_goose", price: 5, quality: 3, max_price: 7, min_price: 3)
  # bar.drinks.create(name: "vodka", brand: "ciroc", price: 5, quality: 3, max_price: 7, min_price: 3)
  # bar.drinks.create(name: "Domestic Beer", brand: "Coors Light", price: 3, quality: 1, max_price: 5, min_price: 1)
  # bar.drinks.create(name: "Domestic Beer", brand: "Samuel Adams Lager", price: 4.7, quality: 1, max_price: 5, min_price: 1)
  # bar.drinks.create(name: "Domestic Beer", brand: "Miller Lite", price: 4, quality: 2, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "Domestic Beer", brand: "Budweiser", price: 5, quality: 3, max_price: 7, min_price: 3)
  # bar.drinks.create(name: "Domestic Beer", brand: "Bud Light", price: 4, quality: 2, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "Domestic Beer", brand: "Michelob Ultra", price: 4, quality: 3, max_price: 6, min_price: 2)
  # bar.drinks.create(name: "wine", brand: "sauvignon_blanc", price: 5, quality: 2, max_price: 7, min_price: 3)
  # bar.drinks.create(name: "wine", brand: "merlot", price: 5, quality: 3, max_price: 7, min_price: 3)

  # Drink.all.each do |drink|
  #   drink.update(current_price: drink.price, price_difference: 0)
  #
  # end


  def create_drink(category, table_name, name, price, max_price, min_price, current_price, price_difference, bio)
    @bar.drinks.create(name: name, price: price, max_price: max_price, min_price: min_price, current_price: current_price, price_difference: price_difference, bio: bio, category: category,
    table_name: table_name)
  end


#Shot of tequlia
  create_drink("shot", "Tequila", "Conquistador", 3.50, 5.04, 1.99, 3.50, 0, "Strong shot of Tequila, will make you think twice about ordering another")
  create_drink("shot", "Tequila", "Patron Silver", 4.25, 6.05, 2.45, 4.25, 0, "Shot of Patron")
  create_drink("shot", "Tequila", "1800", 4.50, 6.45, 2.73, 4.50, 0, "That was a good year")
  create_drink("shot", "Tequila", "Margaritaville Gold", 4.00, 5.87, 2.21, 4.00, 0, "Puts your somewhere on a beach")
  create_drink("shot", "Tequila", "Patron Gold", 4.25, 6.05, 2.45, 4.25, 0, "Dark shot of Patron")

  #Shot of rum
  create_drink("shot", "Rum", "Captain Morgan", 4.00, 6.02, 2.11, 4.00, 0, "Taste's better when your leg is on top of a keg")
  create_drink("shot", "Rum", "Bacardi Gold", 3.50, 5.45, 1.76, 3.50, 0, "For those who like life a little spicy")
  create_drink("shot", "Rum", "Brugal", 3.75, 5.73, 1.86, 3.75, 0, "Let your Dominican freak fly")
  create_drink("shot", "Rum", "Sailor Jerry", 3.25, 5.15, 1.50, 3.25, 0, "Rum for those who curse like Sailors")
  create_drink("shot", "Rum", "Malibu", 3.50, 5.55, 1.35, 3.50, 0, "Cali Flow")


  #shots of whiskey
  create_drink("shot", "Whiskey","Jack Daniels", 4.00, 5.65, 2.01, 4.00, 0, "For the real men in the room")
  create_drink("shot", "Whiskey", "Jameson", 4.00, 5.65, 2.01, 4.00, 0, "The Irish")
  create_drink("shot", "Whiskey", "Jim Bean", 3.75, 5.75, 1.75, 3.75, 0, "Jim is a good man")
  create_drink("shot", "Whiskey", "Wild Turkey", 4.00, 5.75, 2.05, 4.00, 0, "Drink a couple and you will start seeing Wild Turkies")
  create_drink("shot", "Whiskey","Black Label", 4.50, 6.25, 2.50, 4.50, 0, "Best straight up with a side of more whiskey")

#Shots of vodka
  create_drink("shot", "Vodka", "Absolute", 4.25, 6.21, 2.23, 4.25, 0, "Absolutely yes")
  create_drink("shot", "Vodka", "Grey Goose", 5.00, 6.95, 3.05, 5.00, 0, "high quaility vodka")
  create_drink("shot", "Vodka", "Sky Vodka", 4.75, 6.75, 2.75, 4.75, 0, "Gives you the ability to fly high in the sky")
  create_drink("shot", "Vodka", "Smirnoff", 3.75, 1.76, 5.55, 3.75, 0, "More flavors than anyone could count")
  create_drink("shot", "Vodka", "Svedka", 3.00, 1.00, 4.75, 3.00, 0, "Its been a rough night")



  #craft wynwood brewery bers
  create_drink("beer", "Wynwood Brewery", "Pop's Porter", 5.00, 6.95, 3.00, 5.00, 0, "blend of roasted malts that give this beer a nice, roasty aroma with hints of chocolate and coffee")
  create_drink("beer", "Wynwood Brewery", "La Rubia", 5.00, 6.95, 3.00, 5.00, 0, "It has a nice crisp bitterness to it with a slight bready and sweet flavor.")
  create_drink("beer", "Wynwood Brewery", "Wynwood IPA", 5.00, 6.95, 3.00, 5.00, 0, "has a nice, citrusy hop aroma and bitterness that is balanced with a slight caramel sweetness.")
  create_drink("beer", "Wynwood Brewery", "Magic City", 5.00, 6.95, 3.00, 5.00, 0,"a balanced American Pale Ale.")
  create_drink("beer", "Wynwood Brewery", "Rickenbacker", 5.00, 6.95, 3.00, 5.00, 0,"a Bohemian-style pilsner named after Eddie Rickenbacker an American fighter pilot in World War I.")


  #Domestic Beer

  create_drink("beer", "Domestic", "Budweiser", 3.50, 5.50, 1.75, 3.50, 0, "About as American as it gets")
  create_drink("beer", "Domestic","Bud Light", 3.50, 5.50, 1.75, 3.50, 0, "Almost as American as Budweiser")
  create_drink("beer", "Domestic", "Pabst Blue Ribbon", 2.00, 3.25, 0.50, 2.00, 0, "Drinking on a budget")
  create_drink("beer", "Domestic", "Redd's Apple Ale", 4.00, 6.05, 1.95, 4.00, 0, "Very good if you like Apples")
  create_drink("beer", "Domestic","Yuengling", 3.50, 5.50, 1.75, 3.50, 0, "Merica")

  #Imported Beers

  create_drink("beer", "Imported", "Guinness", 4.00, 5.95, 2.05, 4.00, 0, "Dark Beer")
  create_drink("beer", "Imported", "Amstel Light", 4.00, 5.95, 2.05, 4.00, 0, "Just an Amsetel")
  create_drink("beer", "Imported", "Fosters", 4.00, 5.95, 2.05, 4.00, 0, "Big drink in college towns")
  create_drink("beer", "Imported", "Beck's", 4.00, 5.95, 2.05, 4.00, 0, "German beer")
  create_drink("beer", "Imported", "Heineken", 4.00, 5.95, 2.05, 4.00, 0, "Great factory in Amsterdamn")

  #Wines

  create_drink("wine", "Wine", "Pinot Noir", 4.00, 5.95, 2.05, 4.00, 0, "Heavier Red")
  create_drink("wine", "Wine", "Cabernet Sauvignon", 4.00, 5.95, 2.05, 4.00, 0, "Lighter Red")
  create_drink("wine", "Wine", "Pinot Girg", 4.00, 5.95, 2.05, 4.00, 0, "Soft white wine")
  create_drink("wine", "Wine", "Riesling", 4.00, 5.95, 2.05, 4.00, 0, "white wine")
  create_drink("wine", "Wine", "Cabernet Sauvignon", 4.00, 5.95, 2.05, 4.00, 0, "white wine")


#Cocktails
  create_drink("cocktail", "Cocktail", "The Boss", 5.00, 6.85, 3.55, 5.00, 0, "Jameson on the rocks, splash of coke")
  create_drink("cocktail", "Cocktail", "The Grandpa", 6.00, 7.50, 4.50, 6.00, 0, "Tanqueray Martini Str8 up with a twist")
  create_drink("cocktail", "Cocktail", "Irish Car Bomb", 5.00, 6.85, 3.55, 5.00, 0, "Jameson/Baileys shot, Half a glass of Giunness")
  create_drink("cocktail", "Cocktail", "The Dude", 5.00, 6.85, 3.55, 5.00, 0, "typical White Russian")
  create_drink("cocktail", "Cocktail", "A.J", 5.00, 6.85, 3.55, 5.00, 0, "Strawberry Daiquiri")

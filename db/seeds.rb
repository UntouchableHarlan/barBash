# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bar.destroy_all
Owner.destroy_all

Drink.destroy_all
owner = Owner.create(name: "admin", email: "admin@admin.com", password: "asdf")

bar = Bar.create(name: "Wood", owner: owner)


  bar.drinks.create(name: "tequila", brand: "conquistador", price: 3, quality: 1, max_price: 5, min_price:  1)
  bar.drinks.create(name: "tequila", brand: "patron_silver", price: 4, quality: 3, max_price: 6, min_price: 2)
  bar.drinks.create(name: "tequila", brand: "patron_gold", price: 4, quality: 3, max_price: 6, min_price: 2)
  bar.drinks.create(name: "whiskey", brand: "makers_mark", price: 3, quality: 1, max_price: 5, min_price: 1)
  bar.drinks.create(name: "whiskey", brand: "jameson", price: 4, quality: 2, max_price: 6, min_price: 2)
  bar.drinks.create(name: "whiskey", brand: "black_label", price: 5, quality: 2, max_price: 7, min_price: 3)
  bar.drinks.create(name: "whiskey", brand: "blue_label", price: 7, quality: 3, max_price: 9, min_price: 5)
  bar.drinks.create(name: "vokda", brand: "svedka", price: 3, quality: 1, max_price: 5, min_price: 2)
  bar.drinks.create(name: "vokda", brand: "absolute", price: 4, quality: 2, max_price: 6, min_price: 2)
  bar.drinks.create(name: "vokda", brand: "grey_goose", price: 5, quality: 3, max_price: 7, min_price: 3)
  bar.drinks.create(name: "vokda", brand: "ciroc", price: 5, quality: 3, max_price: 7, min_price: 3)
  bar.drinks.create(name: "beer", brand: "budwieser", price: 3, quality: 1, max_price: 5, min_price: 1)
  bar.drinks.create(name: "beer", brand: "amstel", price: 3, quality: 1, max_price: 5, min_price: 1)
  bar.drinks.create(name: "beer", brand: "stella", price: 4, quality: 2, max_price: 6, min_price: 2)
  bar.drinks.create(name: "beer", brand: "craft", price: 5, quality: 3, max_price: 7, min_price: 3)
  bar.drinks.create(name: "wine", brand: "pino_grigo", price: 4, quality: 2, max_price: 6, min_price: 2)
  bar.drinks.create(name: "wine", brand: "chardonnay", price: 4, quality: 3, max_price: 6, min_price: 2)
  bar.drinks.create(name: "wine", brand: "sauvignon_blanc", price: 5, quality: 2, max_price: 7, min_price: 3)
  bar.drinks.create(name: "wine", brand: "merlot", price: 5, quality: 3, max_price: 7, min_price: 3)

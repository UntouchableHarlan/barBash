class Drink < ApplicationRecord
  belongs_to :bar
  has_many :prices
  has_many :sales

  def price_graph_data
    interval = (Time.now.beginning_of_day..Time.now.end_of_day)
    # pp Drink.first.price_graph_data.group_by { |price| p [price.created_at.time.min, price.created_at.time.hour] }
    data = self.prices.group_by { |price|
      "#{price.created_at.time.hour}:#{price.created_at.time.min}"
    }
    new_data = {}
    data.each { |time, price|
      new_data[time] = price.first.amount
    }
    new_data
  end
end

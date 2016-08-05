class Drink < ApplicationRecord
  belongs_to :bar
  has_many :prices
  has_many :sales

  def price_graph_data
    interval = (Time.now.beginning_of_day..Time.now.end_of_day)
    # pp Drink.first.price_graph_data.group_by { |price| p [price.created_at.time.min, price.created_at.time.hour] }
    data = self.prices.group_by { |price|
      array = [0,1,2,3,4,5,6,7,8,9]
      if array.include?(price.created_at.time.min)
        new_min = "0" + price.created_at.time.min.to_s
      else
        new_min = price.created_at.time.min
      end

      if price.created_at.time.hour > 12
        new_hour = price.created_at.time.hour - 12
      "#{new_hour}:#{new_min}pm"
    else
      "#{new_hour}:#{new_min}am"
    end

    }
    new_data = {}
    data.each { |time, price|
      new_data[time] = price.first.amount
    }
    new_data
  end
end

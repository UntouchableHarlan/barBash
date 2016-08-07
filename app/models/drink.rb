class Drink < ApplicationRecord
  belongs_to :bar
  has_many :prices
  has_many :sales

  def price_graph_data
    interval = (Time.now.beginning_of_day..Time.now.end_of_day)
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
  def update_drink_price
  percent_of_capacity_full = 0.8
  array = []
  self.sales.where(created_at: ((Bar.take.timer.seconds.ago)..Time.now)).each {|sale| array << sale.quantity}
  drink_bought_in_last_5mins = array.inject(0){|sum,x| sum + x }
  @last_price = self.current_price
  self.current_price = (0.077852 + (0.72179 * self.price) + (1.8922 * percent_of_capacity_full) + (-0.126937 * drink_bought_in_last_5mins))
  self.current_price = self.current_price.round(2)
    if self.current_price > self.max_price
      self.current_price = self.max_price
    elsif self.current_price < self.min_price
      self.current_price = self.min_price
    end
    if self.save
      Price.create(amount: self.current_price, drink: self)
      self.update(price_difference: (self.current_price - @last_price).round(2))
    end
  end
end

class Price < ApplicationRecord
  belongs_to :drink

  # def self.graph_data
  #   interval = (Time.now.beginning_of_day..Time.now.end_of_day)
  #   # group_by_minute(:created_at, series: false, range: interval).maximum(:amount)
  # end
end

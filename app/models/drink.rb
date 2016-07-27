class Drink < ApplicationRecord
  belongs_to :bar
  has_many :prices
  has_many :sales
end

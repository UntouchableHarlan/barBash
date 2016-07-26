class Bar < ApplicationRecord
  belongs_to :owner
  has_many :drinks
end

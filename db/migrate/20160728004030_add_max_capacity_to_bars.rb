class AddMaxCapacityToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :capacity, :integer
  end
end

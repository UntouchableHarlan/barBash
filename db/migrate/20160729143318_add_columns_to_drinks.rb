class AddColumnsToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :current_price, :float
    add_column :drinks, :price_difference, :float
  end
end

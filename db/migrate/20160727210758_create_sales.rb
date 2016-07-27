class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.float :price
      t.belongs_to :drink, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

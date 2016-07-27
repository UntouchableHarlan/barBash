class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brand
      t.integer :quality
      t.float :price
      t.float :max_price
      t.float :min_price
      t.belongs_to :bar, foreign_key: true

      t.timestamps
    end
  end
end

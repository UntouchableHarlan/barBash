class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.float :amount
      t.belongs_to :drink, foreign_key: true

      t.timestamps
    end
  end
end

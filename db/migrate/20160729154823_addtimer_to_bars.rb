class AddtimerToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :timer, :integer
  end
end

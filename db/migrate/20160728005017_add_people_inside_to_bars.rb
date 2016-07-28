class AddPeopleInsideToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :people_inside, :string
  end
end

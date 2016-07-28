class ChangepeopleinsideToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :bars, :people_inside
    add_column :bars, :people_inside, :integer
  end
end

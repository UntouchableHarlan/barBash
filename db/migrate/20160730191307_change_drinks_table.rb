class ChangeDrinksTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :drinks, :brand
    add_column :drinks, :bio, :text
    add_column :drinks, :category, :string
    add_column :drinks, :table_name, :string
    #table_name is like the name of the table it would be displayed on the home screen
    #the possible entries are beer, wine, cocktail, shot,
  end
end

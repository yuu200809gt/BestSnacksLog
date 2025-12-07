class AddBestalcoholAndFoodtypesToSnacks < ActiveRecord::Migration[7.2]
  def change
    add_column :snacks, :best_alcohol, :string
    add_column :snacks, :Food_types, :string
  end
end

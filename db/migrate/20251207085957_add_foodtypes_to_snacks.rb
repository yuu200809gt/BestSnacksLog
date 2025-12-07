class AddFoodtypesToSnacks < ActiveRecord::Migration[7.2]
  def change
    add_column :snacks, :food_types, :string
  end
end

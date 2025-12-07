class RemoveFoodTypesFromSnacks < ActiveRecord::Migration[7.2]
  def change
    remove_column :snacks, :Food_types, :string
  end
end

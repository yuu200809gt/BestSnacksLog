class CreateSnacks < ActiveRecord::Migration[7.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end

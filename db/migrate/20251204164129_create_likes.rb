class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :snack, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

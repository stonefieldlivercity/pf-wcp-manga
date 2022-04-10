class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float "cool"
      t.float "cute"
      t.float "hot"
      t.float "relax"
      t.float "emotion"
      t.float "funny"
      t.float "complex"
      t.float "brisk"

      t.timestamps
    end
  end
end

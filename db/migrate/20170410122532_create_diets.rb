class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.decimal :amount, precision: 7, scale: 3
      t.datetime :datestart
      t.datetime :dateend
      t.references :animal, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

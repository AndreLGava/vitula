class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :bin, index: true, foreign_key: true
      t.references :feed, index: true, foreign_key: true
      t.references :glebe, index: true, foreign_key: true
      t.string :fournisseur
      t.decimal :amount, precision: 8, scale: 4
      t.datetime :datestock
      t.datetime :datestart
      t.datetime :dateend

      t.timestamps null: false
    end
  end
end

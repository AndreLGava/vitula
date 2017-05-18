class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.decimal :amount, precision: 8, scale: 4
      t.datetime :date
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

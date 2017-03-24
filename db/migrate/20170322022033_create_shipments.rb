class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.decimal :amount
      t.datetime :date
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

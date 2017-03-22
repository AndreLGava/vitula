class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.decimal :amount
      t.datetime :date

      t.timestamps null: false
    end
  end
end

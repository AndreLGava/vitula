class CreateFinancials < ActiveRecord::Migration
  def change
    create_table :financials do |t|
      t.decimal :value, precision: 7, scale: 2
      t.datetime :datetransaction
      t.integer :operation
      t.text :description
      t.references :animal, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :reproduction, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.references :treatment, index: true, foreign_key: true
      t.references :shipment, index: true, foreign_key: true
      t.references :schedule, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

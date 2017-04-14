class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.decimal :long, precision: 10, scale: 8
      t.decimal :lat, precision: 10, scale: 8
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

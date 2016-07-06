class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.float :amount
      t.datetime :measurement
      t.text :observation
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

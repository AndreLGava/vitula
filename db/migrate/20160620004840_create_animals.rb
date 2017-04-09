class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :code
      t.string :name
      t.string :description
      t.date :discard
      t.string :reason_discard
      t.boolean :female
      t.integer :breed
      t.references :lot, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      

      t.timestamps null: false
    end
  end
end

class CreateReproductions < ActiveRecord::Migration
  def change
    create_table :reproductions do |t|
      t.date :heat
      t.date :insemination
      t.date :regress
      t.date :abortion
      t.date :parturition
      t.references :animal, :father, index: true, foreign_key: true
      t.references :animal, :mother, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateReproductions < ActiveRecord::Migration
  def change
    create_table :reproductions do |t|
      t.date :heat
      t.date :insemination
      t.date :regress
      t.date :abortion
      t.date :stop_breastfeeding
      t.date :parturition

      t.timestamps null: false
    end
  end
end

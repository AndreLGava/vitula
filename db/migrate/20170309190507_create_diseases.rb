class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :vulgarname
      t.string :cientificname
      t.text :causes
      t.text :description
      t.text :symptoms

      t.timestamps null: false
    end
  end
end

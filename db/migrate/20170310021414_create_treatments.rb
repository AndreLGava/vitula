class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.date :startdate
      t.date :enddate
      t.decimal :dosage, precision: 8, scale: 4
      t.integer :lack
      t.text :observation
      t.references :illness, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.date :startdate
      t.date :enddate
      t.decimal :dosage
      t.integer :lack
      t.text :observation
      t.references :disease, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.date :startdate
      t.date :enddate
      t.decimal :dosage
      t.integer :lack

      t.timestamps null: false
    end
  end
end

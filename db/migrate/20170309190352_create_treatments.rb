class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.date :StartDate
      t.date :EndDate
      t.decimal :dosage
      t.integer :lack

      t.timestamps null: false
    end
  end
end

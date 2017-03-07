class CreateIllnesses < ActiveRecord::Migration
  def change
    create_table :illnesses do |t|
      t.date :StartDate
      t.date :EndDate
      t.text :sequel
      t.references :animal, index: true, foreign_key: true
      t.references :disease, index: true, foreign_key: true
      t.references :treatment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

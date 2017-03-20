class CreateIllnesses < ActiveRecord::Migration
  def change
    create_table :illnesses do |t|
      t.date :startdate
      t.date :enddate
      t.text :sequel
      t.references :animal, index: true, foreign_key: true
      t.references :disease, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

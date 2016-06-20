class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.string :description
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

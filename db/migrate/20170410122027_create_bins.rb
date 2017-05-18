class CreateBins < ActiveRecord::Migration
  def change
    create_table :bins do |t|
      t.decimal :capacity, precision: 8, scale: 4
      t.references :property, index: true, foreign_key: true
      t.integer :kind

      t.timestamps null: false
    end
  end
end

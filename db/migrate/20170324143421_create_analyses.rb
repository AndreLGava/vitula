class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.references :property, index: true, foreign_key: true
      t.string :codeanalysis
      t.date :collect
      t.decimal :fat, precision: 9, scale: 3
      t.decimal :protein, precision: 9, scale: 3
      t.decimal :lactose, precision: 9, scale: 3
      t.decimal :totalsolids, precision: 9, scale: 3
      t.decimal :defattedextract, precision: 9, scale: 3
      t.decimal :css
      t.decimal :scorecss
      t.decimal :ufc

      t.timestamps null: false
    end
  end
end

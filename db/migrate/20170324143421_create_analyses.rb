class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.references :property, index: true, foreign_key: true
      t.string :codeanalysis
      t.date :collect
      t.decimal :fat
      t.decimal :protein
      t.decimal :lactose
      t.decimal :totalsolids
      t.decimal :defattedextract
      t.decimal :css
      t.decimal :scorecss
      t.decimal :ufc

      t.timestamps null: false
    end
  end
end

class CreateBatchanimals < ActiveRecord::Migration
  def change
    create_table :batchanimals do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

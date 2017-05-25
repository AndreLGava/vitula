class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.text :observation
      t.integer :type
      t.date :formation
      t.references :glebe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

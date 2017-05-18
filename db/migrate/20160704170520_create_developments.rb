class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.decimal :weight, precision: 7, scale: 3
      t.decimal :height, precision: 5, scale: 2
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

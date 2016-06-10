class CreateFuncionalities < ActiveRecord::Migration
  def change
    create_table :funcionalities do |t|
      t.string :name
      t.string :description
      t.references :modulo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

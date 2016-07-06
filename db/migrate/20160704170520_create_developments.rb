class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.float :weight
      t.float :height
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

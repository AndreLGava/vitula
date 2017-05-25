class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :provider
      t.string :goal
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateGlebes < ActiveRecord::Migration
  def change
    create_table :glebes do |t|
      t.string :name
      t.integer :purpose
      t.decimal :area
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

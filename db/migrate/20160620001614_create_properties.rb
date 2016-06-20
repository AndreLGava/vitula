class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.float :long
      t.float :lat

      t.timestamps null: false
    end
  end
end

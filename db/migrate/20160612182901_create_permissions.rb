class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :create
      t.boolean :read
      t.boolean :update
      t.boolean :delete
      t.boolean :print
      t.references :modulo, index: true, foreign_key: true
      t.references :functionality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

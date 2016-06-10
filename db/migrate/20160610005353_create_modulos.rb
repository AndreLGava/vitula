class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

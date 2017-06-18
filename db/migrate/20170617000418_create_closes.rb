class CreateCloses < ActiveRecord::Migration
  def change
    create_table :closes do |t|
      t.datetime :dateclosing
      t.decimal :totalvalue, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end

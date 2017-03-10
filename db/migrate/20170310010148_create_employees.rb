class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :work
      t.string :name
      t.date :startwork
      t.date :endwork
      t.date :born
      t.string :phone
      t.string :rg
      t.string :cpf
      t.integer :schooling
      t.integer :inss
      t.integer :pis
      t.decimal :salary
      t.string :profession
      t.integer :payment
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

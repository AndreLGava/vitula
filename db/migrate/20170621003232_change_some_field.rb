class ChangeSomeField < ActiveRecord::Migration
  def change
  	change_column :properties, :long, :string
  	change_column :properties, :lat, :string
  	change_column :developments, :weight, :decimal, precision: 10, scale: 2
  	change_column :developments, :height, :decimal, precision: 10, scale: 2
  	change_column :productions, :amount, :decimal, precision: 10, scale: 2
  	change_column :properties, :area, :decimal, precision: 10, scale: 2
  	change_column :glebes, :area, :decimal, precision: 10, scale: 2
  	change_column :employees, :salary, :decimal, precision: 10, scale: 2
  	change_column :treatments, :dosage, :decimal, precision: 10, scale: 2
  	change_column :shipments, :amount, :decimal, precision: 10, scale: 2
  	change_column :analyses, :fat, :decimal, precision: 10, scale: 2
  	change_column :analyses, :protein, :decimal, precision: 10, scale: 2
  	change_column :analyses, :lactose, :decimal, precision: 10, scale: 2
  	change_column :analyses, :totalsolids, :decimal, precision: 10, scale: 2
  	change_column :analyses, :defattedextract, :decimal, precision: 10, scale: 2
  	change_column :bins, :capacity, :decimal, precision: 10, scale: 2
  	change_column :stocks, :amount, :decimal, precision: 10, scale: 2
  	change_column :stocks, :density, :decimal, precision: 10, scale: 2
  	change_column :diets, :amount, :decimal, precision: 10, scale: 2
  	change_column :financials, :value, :decimal, precision: 10, scale: 2
  end
end

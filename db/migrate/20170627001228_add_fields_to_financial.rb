class AddFieldsToFinancial < ActiveRecord::Migration
  def change
  	add_column :financials, :valor_litro, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_bacteria, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_ccs, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_gordura, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_tanque, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_canalizacao, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_frete, :decimal, precision: 10, scale: 2
  	add_column :financials, :b_compra, :decimal, precision: 10, scale: 2
  end
end

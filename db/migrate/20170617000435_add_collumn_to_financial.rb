class AddCollumnToFinancial < ActiveRecord::Migration
  def change
  	  	add_reference :financials, :close, index: true, foreign_key: true
  end
end

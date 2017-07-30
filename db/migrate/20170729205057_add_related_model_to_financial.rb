class AddRelatedModelToFinancial < ActiveRecord::Migration
  def change
  	add_column :financials, :related, :string
  end
end

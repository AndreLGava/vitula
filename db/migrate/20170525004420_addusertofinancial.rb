class Addusertofinancial < ActiveRecord::Migration
  def change
  	add_reference :financials, :user, index: true, foreign_key: true
  end
end

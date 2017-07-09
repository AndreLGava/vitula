class AddUserToClose < ActiveRecord::Migration
  def change
  	add_reference  :closes, :user, index: true, foreign_key: true
  end
end

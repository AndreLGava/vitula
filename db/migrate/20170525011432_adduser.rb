class Adduser < ActiveRecord::Migration
  def change
	  add_reference  :schedules, :user, index: true, foreign_key: true
	  add_reference  :events, :user, index: true, foreign_key: true
	  add_reference  :batches, :user, index: true, foreign_key: true
	  add_reference  :services, :user, index: true, foreign_key: true
  end
end

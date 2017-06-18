class AddCollumnToShipment < ActiveRecord::Migration
  def change
  	  	add_reference :shipments, :financial, index: true, foreign_key: true
  end
end

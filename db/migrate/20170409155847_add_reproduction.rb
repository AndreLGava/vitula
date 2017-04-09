class AddReproduction < ActiveRecord::Migration
  def change
  	add_reference :animals, :reproduction, index: true, foreign_key: true
  end
end

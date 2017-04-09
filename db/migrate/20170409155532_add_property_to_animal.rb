class AddPropertyToAnimal < ActiveRecord::Migration
  def change
  	add_reference :animals, :property, index: true, foreign_key: true
  end
end

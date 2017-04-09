class AnimalDonor < ActiveRecord::Migration
  def change
  	add_column :animals, :donor, :boolean, default: false
  end
end

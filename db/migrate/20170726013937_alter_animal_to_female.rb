class AlterAnimalToFemale < ActiveRecord::Migration
  def change
  	change_column :animals, :female, :boolean, default: :true
  end
end

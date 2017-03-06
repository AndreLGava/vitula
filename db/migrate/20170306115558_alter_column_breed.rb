class AlterColumnBreed < ActiveRecord::Migration
	change_column :animals, :breed, :integer
end

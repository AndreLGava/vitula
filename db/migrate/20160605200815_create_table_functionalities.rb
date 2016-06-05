class CreateTableFunctionalities < ActiveRecord::Migration
  def change
    create_table :functionalities do |t|
    	t.integer 	:code
    	t.string  	:name
    	t.string  	:description
    end

    add_foreign_key :functionalities, :modules
    add_index       :functionalities, :code,                unique: true

  end
end

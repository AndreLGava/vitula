class CreateTableModules < ActiveRecord::Migration
  def change
    create_table :modules do |t|
    	t.integer		:code
    	t.string		:name
    	t.string		:description
    end

    add_index :modules, :code,                unique: true

  end
end

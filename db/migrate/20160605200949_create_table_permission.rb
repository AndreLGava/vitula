class CreateTablePermission < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
    	t.boolean :create
  		t.boolean :read
  		t.boolean :update
  		t.boolean :delete
  		t.boolean :print
    end

    add_foreign_key :permissions, :functionalities

  end
end

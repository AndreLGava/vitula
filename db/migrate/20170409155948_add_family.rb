class AddFamily < ActiveRecord::Migration
  def change
      add_column :reproductions, :father_id, :integer
      add_column :reproductions, :mother_id, :integer

  end
end

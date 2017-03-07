class AddInactiveOnGlebe < ActiveRecord::Migration
  def change
  	add_column :glebes, :inactive, :boolean, default: false
  end
end

class AddFieldToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :area, :decimal, precision: 8, scale: 1
    add_column :properties, :altitude, :decimal
    add_column :properties, :precipitation, :decimal
    add_column :properties, :enrolement_of_sanity, :integer
    add_column :properties, :nirf, :string
    add_column :properties, :incra, :string
    add_column :properties, :state_registration, :string
    add_column :properties, :manager, :string
  end
end

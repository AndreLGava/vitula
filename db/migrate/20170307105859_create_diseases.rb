class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :VulgarName
      t.string :CientificName
      t.text :Causes
      t.text :Description
      t.text :Symptoms

      t.timestamps null: false
    end
  end
end

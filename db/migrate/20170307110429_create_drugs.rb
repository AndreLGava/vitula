class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :laboratory
      t.string :reference
      t.text :presentation
      t.text :use
      t.text :composition
      t.text :indication
      t.text :contraindication
      t.text :warning
      t.text :interaction
      t.text :effect
      t.text :dosage
      t.text :overdosage
      t.text :properties
      t.text :species

      t.timestamps null: false
    end
  end
end

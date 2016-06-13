class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :criar
      t.boolean :ler
      t.boolean :atualizar
      t.boolean :deletar
      t.boolean :imprimir
      t.references :profile, index: true, foreign_key: true
      t.references :functionality, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

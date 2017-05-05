class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :kind
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

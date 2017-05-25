class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :event, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true
      t.datetime :datestart
      t.datetime :dateend
      t.text :observation

      t.timestamps null: false
    end
  end
end

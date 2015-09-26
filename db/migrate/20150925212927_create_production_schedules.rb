class CreateProductionSchedules < ActiveRecord::Migration
  def change
    create_table :production_schedules do |t|
      t.datetime :production_date, null: false
      
      t.userstamps
      t.timestamps
    end
  end
end

class CreateProductionFormulas < ActiveRecord::Migration
  def change
    create_table :production_formulas do |t|
      t.references :master_formula, index: true, foreign_key: true, null: false
      t.references :production_schedule, index: true, foreign_key: true, null: false
      t.integer :tonnage

      t.userstamps
      t.timestamps
    end
  end
end

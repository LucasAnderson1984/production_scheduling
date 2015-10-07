class CreateProductionItems < ActiveRecord::Migration
  def change
    create_table :production_items do |t|
      t.references :production_formula, index: true, foreign_key: true, null: false
      t.references :item_master, index: true, foreign_key: true, null: false
      t.integer :quantity

      t.userstamps
      t.timestamps
    end
  end
end

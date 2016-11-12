class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :price
      t.string :vendor_number
      t.belongs_to :pizza, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

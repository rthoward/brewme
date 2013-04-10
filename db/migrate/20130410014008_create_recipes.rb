class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :coffee
      t.integer :coffee_amt
      t.integer :water_amt
      t.integer :water_temp
      t.text :instructions

      t.timestamps
    end
  end
end

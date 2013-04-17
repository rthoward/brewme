class AddOriginalRecipeId < ActiveRecord::Migration
  def up    
  	add_column :recipes, :original_recipe_id, :integer
  end

  def down
  	remove_column :recipes, :original_recipe_id
  end
end

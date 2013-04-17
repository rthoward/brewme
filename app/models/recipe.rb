class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :mods, class_name: "Recipe", foreign_key: "original_recipe_id"

  attr_accessible :coffee, :coffee_amt, :instructions, :name, 
  								:water_amt, :water_temp, :original_recipe_id

  validates :user_id, presence: true
  validates :instructions, presence: true, length: { maximum: 10000 }

  default_scope order: 'recipes.created_at DESC'

  def modifies(recipe)
  	self.coffee = recipe.coffee
  	self.coffee_amt = recipe.coffee_amt
  	self.instructions = recipe.instructions
  	self.water_amt = recipe.water_amt
  	self.water_temp = recipe.water_temp
  	self.original_recipe_id = recipe.id
  end

  def references(recipe)
  	self.original_recipe_id = recipe.id
  end

  def is_mod?
  	return !original_recipe_id.nil?
  end

  def original
  	return Recipe.find_by_id(original_recipe_id)
  end

end
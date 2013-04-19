class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :mods, class_name: "Recipe", foreign_key: "original_recipe_id"

  attr_accessible :coffee, :coffee_amt, :instructions, :name, 
  								:water_amt, :water_temp, :original_recipe_id

  validates :user_id, presence: true
  validates :instructions, presence: true, length: { maximum: 10000 }

  default_scope order: 'recipes.created_at DESC'

  # helper methods ------------------------------

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

  def parent
  	return Recipe.find_by_id(original_recipe_id)
  end

  def root
    return mod_hierarchy.first
  end

  def has_siblings?
    return false if !is_mod?
    return false if parent.mods.nil?
    return parent.mods.size > 1
  end

  def siblings
    return parent.mods
  end

  def siblings_only
    return siblings.reject {|node| node == self}     
  end

  def children
    return mods
  end

  # returns lineage of recipe tweaks, with oldest ancestor first
  def mod_hierarchy
    hierarchy = Array.new
    current_recipe = self
    hierarchy << current_recipe

    while current_recipe.is_mod?
      hierarchy << current_recipe = current_recipe.parent
    end

    return hierarchy.reverse
  end

end
class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :mods, class_name: "Recipe", foreign_key: "original_recipe_id"

  attr_accessible :coffee, :coffee_amt, :instructions, :name, 
  								:water_amt, :water_temp, :original_recipe_id

  validates :user_id, presence: true
  validates :instructions, presence: true, length: { maximum: 10000 }

  default_scope order: 'recipes.created_at DESC'
end
class Recipe < ActiveRecord::Base
  attr_accessible :coffee, :coffee_amt, :instructions, :name, :water_amt, :water_temp

  default_scope order: 'recipes.created_at DESC'
end


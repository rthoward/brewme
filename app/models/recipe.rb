class Recipe < ActiveRecord::Base

  belongs_to :user

  attr_accessible :coffee, :coffee_amt, :instructions, :name, :water_amt, :water_temp

  validates :user_id, presence: true
  validates :instructions, presence: true, length: { maximum: 10000 }

  default_scope order: 'recipes.created_at DESC'
end


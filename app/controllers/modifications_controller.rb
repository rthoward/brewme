class ModificationsController < ApplicationController
  
  def new
  	@original = Recipe.find_by_id(params[:id])
  	@mod = current_user.recipes.new
  	@mod.modifies(@original)
  	@original.mods << @mod
  end

  def create
  	@mod = current_user.recipesss.build(params[:recipe])


  	if @mod.save 
  		flash[:sucess] = "modification made"
  	else
  		flash[:erorr] = "modification failed"
  	end


  end

end
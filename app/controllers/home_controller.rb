class HomeController < ApplicationController
  
  def index
  	
    if signed_in?
      @recipes = Recipe.all
      render 'newest'
    else
      render 'home'
    end
  end

end

class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(get_recipe_params)
    if @recipe.save
      redirect_to user_path(@logged_in_user)
    else
      render :new
    end
  end

  private

  def get_recipe_params
    params.require(:recipe).permit(:name, :protein, :carbohydrate, :fat)
  end

end

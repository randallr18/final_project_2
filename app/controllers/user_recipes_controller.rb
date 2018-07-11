class UserRecipesController < ApplicationController

  def new
    @user_recipe = UserRecipe.new
    @recipes = Recipe.all
  end
end

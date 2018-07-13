class UserRecipesController < ApplicationController
  before_action :get_user_recipe_parms, only: [:edit, :update, :destroy]

  def new
    @user_recipe = UserRecipe.new
    @recipes = Recipe.all
  end

  def create
    @user_recipe = UserRecipe.new(recipe_user_params)
    @user_recipe.user_id = @logged_in_user.id
    if @user_recipe.save
      redirect_to user_path(@logged_in_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_recipe.update(recipe_user_params)
      redirect_to user_path(@logged_in_user)
    else
      render :edit
    end
  end

  def destroy
    @user_recipe.delete
    redirect_to user_path(@logged_in_user)
  end

  private

  def recipe_user_params
    params.require(:user_recipe).permit(:recipe_id, "date_consumed(1i)", "date_consumed(2i)", "date_consumed(3i)")
  end

  def get_user_recipe_parms
    @user_recipe = UserRecipe.find(params[:id])
  end

end

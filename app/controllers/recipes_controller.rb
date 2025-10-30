class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource # CanCanCan se encarga de set_recipe automáticamente

  def index
    @recipes = Recipe.order(:title) # Todos pueden ver todas las recetas
  end

  def show
  end

  def new
  end

  def create
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: "Recipe created successfully."
    else
      flash.now[:alert] = "There was an error creating the recipe."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe updated successfully."
    else
      flash.now[:alert] = "There was an error updating the recipe."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_path, notice: "Recipe deleted successfully."
    else
      redirect_to recipes_path, alert: "There was an error deleting the recipe."
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :difficulty, :instructions)
  end
end

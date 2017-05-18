class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    sort_attribute = params[:sort]
    if sort_attribute
      @recipes = Recipe.all.order(sort_attribute)
    end
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
  end

  def new
    
  end

  def create
    recipe = Recipe.new(
                        title: params[:title],
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time],
                        user_id: current_user.id
                        )
    recipe.save
    flash[:success] = "Recipe Successfully Created"
    redirect_to "/recipes/#{ recipe.id }"
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.assign_attributes(
                             title: params[:title],
                             ingredients: params[:ingredients],
                             directions: params[:directions],
                             prep_time: params[:prep_time]
                             )
    recipe.save
    flash[:success] = "Recipe Successfully Updated"
    redirect_to "/recipes/#{ recipe.id }"
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:warning] = "Recipe Destroyed"
    redirect_to "/"
  end
end









class Api::V1::RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.create(
                            title: params[:title],
                            ingredients: params[:ingredients],
                            directions: params[:directions],
                            prep_time: params[:prep_time],
                            user_id: current_user.id
                            )
    render :show
  end

  def show

  end

  def update
    @recipe.update(
                   title: params[:title],
                   ingredients: params[:ingredients],
                   directions: params[:directions],
                   prep_time: params[:prep_time]
                   )
    render :show
  end

  def destroy
    @recipe.destroy
    render json: {message: 'recipe deleted'}, status: 204
  end

private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end








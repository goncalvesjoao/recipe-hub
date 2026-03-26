class Recipes::BaseController < ApplicationController
  before_action :set_recipe

  private

  def set_recipe
    @recipe = Recipe.find(params.expect(:recipe_id))
  end
end

class Recipes::UserLikesController < Recipes::BaseController
  # POST /user_likes
  def create
    # @recipe_user_like = @recipe.recipe_user_likes.create!(user: Current.user)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("#{dom_id(@recipe)}-header", partial: "recipes/_recipe_header",
          locals: { recipe: @recipe })
      end

      format.html { render "recipes/_recipe_header", locals: { recipe: @recipe } }
    end
  end

  # DELETE /user_likes
  def destroy
    @recipe_user_like = @recipe.recipe_user_likes.find_by!(user: Current.user)
    @recipe_user_like.destroy!

    render "recipes/_recipe_header", locals: { recipe: @recipe }
  end
end

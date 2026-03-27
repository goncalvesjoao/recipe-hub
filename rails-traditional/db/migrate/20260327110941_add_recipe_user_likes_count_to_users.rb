class AddRecipeUserLikesCountToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :recipe_user_likes_count, :integer, default: 0, null: false
  end
end

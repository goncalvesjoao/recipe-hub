class CreateRecipeUserLikes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipe_user_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :recipe_user_likes, dependent: :destroy
  has_many :liked_recipes, through: :recipe_user_likes, source: :recipe


  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def liked?(recipe)
    liked_recipes.exists?(id: recipe.id)
  end
end

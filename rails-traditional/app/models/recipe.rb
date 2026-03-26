class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipe_user_likes
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
end

class Recipe < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :recipe_ingredients
  has_many :recipe_user_likes
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
end

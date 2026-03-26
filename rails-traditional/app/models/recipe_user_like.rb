class RecipeUserLike < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :recipe, counter_cache: :likes_count
end

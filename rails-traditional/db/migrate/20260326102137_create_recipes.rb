class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :steps
      t.integer :preparation_time_seconds
      t.integer :cooking_time_seconds
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

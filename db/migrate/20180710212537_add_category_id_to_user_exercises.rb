class AddCategoryIdToUserExercises < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_exercises, :category, foreign_key: true
  end
end

class AddProgressMadeAndGoalAndGoalCategoryToUserExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :user_exercises, :progress, :float
    add_column :user_exercises, :goal, :float
    add_column :user_exercises, :goal_category, :string
  end
end

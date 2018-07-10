class AddProgressMadeAndGoalAndGoalCategoryToUserExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :user_exercises, :progress, :integer
    add_column :user_exercises, :goal, :integer
    add_column :user_exercises, :goal_category, :string
  end
end

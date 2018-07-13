class DropUeColumms < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_exercises, :max_weight
    remove_column :user_exercises, :endurance
    remove_column :user_exercises, :courses_attended
    remove_column :user_exercises, :progress
    remove_column :user_exercises, :goal
    remove_column :user_exercises, :goal_category
    remove_column :user_exercises, :category_id
    remove_column :exercises, :description
    remove_column :exercises, :category
  end
end

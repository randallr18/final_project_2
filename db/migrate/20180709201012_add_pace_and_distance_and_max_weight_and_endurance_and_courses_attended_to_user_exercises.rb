class AddPaceAndDistanceAndMaxWeightAndEnduranceAndCoursesAttendedToUserExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :user_exercises, :pace, :integer
    add_column :user_exercises, :distance, :integer
    add_column :user_exercises, :max_weight, :integer
    add_column :user_exercises, :endurance, :integer
    add_column :user_exercises, :courses_attended, :integer
  end
end

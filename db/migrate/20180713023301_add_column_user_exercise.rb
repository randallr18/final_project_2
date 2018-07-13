class AddColumnUserExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :user_exercises, :date, :date
  end
end

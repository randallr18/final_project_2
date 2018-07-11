class EditColumn3 < ActiveRecord::Migration[5.2]
  def change
    add_column :user_recipes, :date_consumed, :date
  end
end

class EditRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :carbohydrate, :integer
    add_column :recipes, :protein, :integer
    add_column :recipes, :fat, :integer
    add_column :recipes, :calorie_count, :integer
  end
end

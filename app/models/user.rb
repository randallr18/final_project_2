class User < ApplicationRecord
  has_many :user_exercises
  has_many :exercises, through: :user_exercises
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :categories, through: :user_exercises

  has_secure_password

  def average_calories_month
    time = Time.new
    year = t.year
    month = t.month
    day = t.day
    counter = 1
    while day >= counter
      new_time = Time.new(year, month, counter)
      time_look_up = new_time.strftime("%Y-%m-%d")
      @meals = UserRecipe.find_by()
  end

  def toal_calories_day

  end
end

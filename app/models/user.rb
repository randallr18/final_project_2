class User < ApplicationRecord
  has_many :user_exercises
  has_many :exercises, through: :user_exercises
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :categories, through: :user_exercises
  has_many :sleeps

  has_secure_password

  # NUTRITION

  def average_calories_per_day
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    counter = 1
    count = 0
    total_calories_month = 0
    while day >= counter
      new_time = Time.new(year, month, counter)
      time_look_up = new_time.strftime("%Y-%m-%d")
      @meals = UserRecipe.where(date_consumed: time_look_up)
      if @meals.length > 0
      total_calories_month += total_calories_day(@meals)
      count += 1
      end
      counter += 1
    end
    average_calories = total_calories_month / count
  end

  def total_calories_day(meals)
    total_calories = 0
    meals.map do |meal|
      total_calories += meal.recipe.calorie_count
    end
    total_calories
  end

  def average_breakdown_food_groups
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    counter = 1
    total_proteins_month = 0
    total_carbohydrates_month = 0
    total_fats_month = 0
    while day >= counter
      new_time = Time.new(year, month, counter)
      time_look_up = new_time.strftime("%Y-%m-%d")
      @meals = UserRecipe.where(date_consumed: time_look_up)
      if @meals != nil
      total_proteins_month += total_proteins_day(@meals)
      total_carbohydrates_month += total_carbohydrates_day(@meals)
      total_fats_month += total_fats_day(@meals)
      end
      counter += 1
    end
    total_foods = total_proteins_month + total_carbohydrates_month +total_fats_month
    protein_breakdown =  total_proteins_month.to_f / total_foods.to_f
    carbohydrate_breakdown = total_carbohydrates_month.to_f / total_foods.to_f
    fat_breakdown = total_fats_month.to_f / total_foods.to_f
    breakdown_hash = {}
    breakdown_hash["proteins"] = (protein_breakdown * 100).round(2)
    breakdown_hash["carbohydrates"] = (carbohydrate_breakdown * 100).round(2)
    breakdown_hash["fats"] = (fat_breakdown * 100).round(2)
    breakdown_hash
  end

  def total_proteins_day(meals)
    total_proteins = 0
    meals.map do |meal|
      total_proteins += meal.recipe.protein
    end
    total_proteins
  end

  def total_carbohydrates_day(meals)
    total_carbohydrates = 0
    meals.map do |meal|
      total_carbohydrates += meal.recipe.carbohydrate
    end
    total_carbohydrates
  end

  def total_fats_day(meals)
    total_fats = 0
    meals.map do |meal|
      total_fats += meal.recipe.fat
    end
    total_fats
  end


  def all_meals_for_a_month(month)
    time = Time.new
    year = time.year
    month_today = time.month
    counter = 1
    meals_array = []
    if month_today == month
      while time.day >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @meals = UserRecipe.where(date_consumed: time_look_up)
        if @meals != nil
          meals_array << @meals
        end
        counter += 1
      end
    else
      while 31 >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @meals = UserRecipe.where(date_consumed: time_look_up)
        if @meals != nil
          meals_array << @meals
        end
        counter += 1
      end
    end
    meals_array
  end

  # SLEEP

  def average_sleep_per_day
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    counter = 1
    count = 0
    total_hours_slept = 0
    while day >= counter
      new_time = Time.new(year, month, counter)
      time_look_up = new_time.strftime("%Y-%m-%d")
      sleep_obj = Sleep.find_by(date: time_look_up)
      if sleep_obj != nil
        total_hours_slept += sleep_obj.hours
        count += 1
      end
      counter += 1
    end
    (total_hours_slept.to_f / count.to_f).round(2)
  end

  def all_sleeps_for_a_month(month)
    time = Time.new
    year = time.year
    month_today = time.month
    counter = 1
    sleep_array = []
    if month_today == month
      while time.day >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @sleep = Sleep.find_by(date: time_look_up)
        if @sleep != nil
          sleep_array << @sleep
        else
          sleep_array << ''
        end
        counter += 1
      end
    else
      while 31 >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @sleep = Sleep.find_by(dat: time_look_up)
        if @sleep != nil
          sleep_array << @sleep
        end
        counter += 1
      end
    end
    sleep_array
  end



end

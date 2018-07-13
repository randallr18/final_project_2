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
    if total_calories_month == 0
      average_calories = 0
    else
    average_calories = total_calories_month / count
    end
    average_calories
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

  def nutrition_score_calories
    average_calories = average_calories_per_day
    if average_calories > 2500
      difference = average_calories - 2500
      score = ((2500 - difference).to_f / 2500.to_f)
      return (score * 10).round(2)
    else
      score = (average_calories.to_f / 2500.to_f)
      return (score * 10).round(2)
    end
  end

  def nutrition_score_food_breakdown
    breakdown_hash = average_breakdown_food_groups
    if breakdown_hash["proteins"] > 27
      difference = breakdown_hash["proteins"] - 27
      protein_score = ((27 - difference).to_f / 27.to_f)
      final_protein_score = (protein_score * 10).round(2)
    else
      protein_score = (breakdown_hash["proteins"].to_f / 2500.to_f)
      final_protein_score = (protein_score * 10).round(2)
    end
    if breakdown_hash["carbohydrates"] > 27
      difference = breakdown_hash["carbohydrates"] - 27
      carbohydrate_score = ((27 - difference).to_f / 27.to_f)
      final_carbohydrate_score = (carbohydrate_score * 10).round(2)
    else
      carbohydrate_score = (breakdown_hash["carbohydrates"].to_f / 2500.to_f)
      final_carbohydrate_score = (carbohydrate_score * 10).round(2)
    end
    if breakdown_hash["fats"] > 27
      difference = breakdown_hash["fats"] - 27
      fat_score = ((27 - difference).to_f / 27.to_f)
      final_fat_score = (fat_score * 10).round(2)
    else
      fat_score = (breakdown_hash["fats"].to_f / 2500.to_f)
      final_fat_score = (fat_score * 10).round(2)
    end
    ((final_fat_score + final_protein_score + final_carbohydrate_score) / 3).round(2)
  end

  def nutrition_score
    ((nutrition_score_calories + nutrition_score_food_breakdown) / 2).round(2)
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

  def sleep_score
    average_hours = average_sleep_per_day
    if average_hours > 8
      return 10
    else
      score = (average_hours / 8.to_f).round(3)
      return (score * 10)
    end
  end

  #EXERCISE

  def average_workouts_per_past_4weeks
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    counter = 1
    total_workouts_completed = 0
    while 28 >= counter
      new_time = Time.new(year, month, day)
      time_look_up = new_time.strftime("%Y-%m-%d")
      workout_obj = UserExercise.find_by(date: time_look_up)
      if workout_obj != nil
        total_workouts_completed += 1
      end
      day -= 1
      if day == 0
        month -= 1
        day = 30
      end
      counter += 1
    end
    ((total_workouts_completed.to_f / 28.to_f).round(2)) * 4
  end


  def all_workouts_for_a_month(month)
    time = Time.new
    year = time.year
    month_today = time.month
    counter = 1
    workout_array = []
    if month_today == month
      while time.day >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @workout = UserExercise.find_by(date: time_look_up)
        if @workout != nil
          workout_array << @workout
        else
          workout_array << ''
        end
        counter += 1
      end
    else
      while 31 >= counter
        new_time = Time.new(year, month, counter)
        time_look_up = new_time.strftime("%Y-%m-%d")
        @workout = UserExercise.find_by(dat: time_look_up)
        if @workout != nil
          workout_array << @workout
        end
        counter += 1
      end
    end
    workout_array
  end

  def exercise_score
    average_workouts = average_workouts_per_past_4weeks
    if average_workouts > 4
      return 10
    else
      score = (average_workouts / 4.to_f).round(3)
      return (score * 10).round(2)
    end
  end
  #
  # def all_workouts_for_month(month)
  #   time = Time.new
  #   year = time.year
  #   month = time.month
  #   day = time.day
  #   counter = 1
  #   all_workouts = []
  #   while 28 >= counter
  #     new_time = Time.new(year, month, day)
  #     time_look_up = new_time.strftime("%Y-%m-%d")
  #     workout_obj = UserExercise.find_by(date: time_look_up)
  #     if workout_obj != nil
  #       all_workouts << workout_obj
  #     else
  #       all_workouts << ''
  #     end
  #     day -= 1
  #     if day == 0
  #       month -= 1
  #       day = 30
  #     end
  #     counter += 1
  #   end
  #   all_workouts.reverse
  # end

# AGGREGATE SCORE
  def aggregate_score
    ((nutrition_score + sleep_score + exercise_score) / 3).round(2)
  end


end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserExercise.delete_all
UserRecipe.delete_all
User.delete_all
Category.delete_all
Exercise.delete_all
Recipe.delete_all


recipe1 = Recipe.create(name: "burger", carbohydrate: 33, protein: 40, fat: 20, calorie_count: 800)
recipe2 = Recipe.create(name: "pizza", carbohydrate: 20, protein: 15, fat: 20, calorie_count: 600)
recipe3 = Recipe.create(name: "BBQ", carbohydrate: 25, protein: 40, fat: 20, calorie_count: 900)
recipe4 = Recipe.create(name: "sushi", carbohydrate: 10, protein: 40, fat: 10, calorie_count: 400)
recipe5 = Recipe.create(name: "sandwich", carbohydrate: 25, protein: 20, fat: 20, calorie_count: 500)
recipe6 = Recipe.create(name: "salad", carbohydrate: 33, protein: 40, fat: 20, calorie_count: 100)

exercise1 = Exercise.create(name: "Running", description: "The marathon is a long-distance race, completed by running, walking, or a run/walk strategy.")
exercise2 = Exercise.create(name: "Yoga", description: "Lateral Weight Training")
exercise3 = Exercise.create(name: "Strength-Training", description: "Calming")
exercise4 = Exercise.create(name: "Sport", description: "Relaxing")


category1 = Category.create(name: "Distance")
category2 = Category.create(name: "Heart Rate")
category3 = Category.create(name: "Speed")
category4 = Category.create(name: "Pace")
category5 = Category.create(name: "Strength Training")
category6 = Category.create(name: "Yoga")

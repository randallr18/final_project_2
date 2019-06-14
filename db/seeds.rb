# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Category.delete_all
Exercise.delete_all
UserExercise.delete_all

user1 = User.create(name: "Jarret", username:"jarrettt", hometown: "New York")
user2 = User.create(name: "Risher", username:"rish-randall", hometown: "Houston")
user3 = User.create(name: "Chang", username:"chang-chang", hometown: "New York")
user4 = User.create(name: "Fred", username:"funky-fred", hometown: "San Fransisco")
user5 = User.create(name: "Sussie", username:"sneaky-sussie", hometown: "Boston")

exercise1 = Exercise.create(name: "Marathon", description: "The marathon is a long-distance race, completed by running, walking, or a run/walk strategy.")
exercise2 = Exercise.create(name: "Bench Press", description: "Lateral Weight Training")
exercise3 = Exercise.create(name: "Downward Dog", description: "Calming")
exercise4 = Exercise.create(name: "Walking", description: "Relaxing")
exercise5 = Exercise.create(name: "Hot-Yoga", description: "Weight Loss")
exercise6 = Exercise.create(name: "Squat", description: "Vertical Weight Training")

category1 = Category.create(name: "Distance")
category2 = Category.create(name: "Heart Rate")
category3 = Category.create(name: "Speed")
category4 = Category.create(name: "Pace")
category5 = Category.create(name: "Strength Training")
category6 = Category.create(name: "Yoga")

num1 = UserExercise.create(user_id: user1.id, exercise_id: exercise1.id, category_id: category1.id)
num2 = UserExercise.create(user_id: user1.id, exercise_id: exercise3.id, category_id: category2.id)
num3 = UserExercise.create(user_id: user1.id, exercise_id: exercise4.id, category_id: category3.id)
num4 = UserExercise.create(user_id: user2.id, exercise_id: exercise1.id, category_id: category4.id)
num5 = UserExercise.create(user_id: user2.id, exercise_id: exercise4.id, category_id: category5.id)
num6 = UserExercise.create(user_id: user3.id, exercise_id: exercise2.id, category_id: category5.id)
num7 = UserExercise.create(user_id: user4.id, exercise_id: exercise5.id, category_id: category1.id)
num8 = UserExercise.create(user_id: user4.id, exercise_id: exercise1.id, category_id: category2.id)
num9 = UserExercise.create(user_id: user4.id, exercise_id: exercise6.id, category_id: category3.id)
num10 = UserExercise.create(user_id: user5.id, exercise_id: exercise2.id, category_id: category4.id)

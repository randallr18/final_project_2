# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Exercise.delete_all
UserExercise.delete_all

user1 = User.create(name: "Jarret", username:"jarrettt", hometown: "New York")
user2 = User.create(name: "Risher", username:"rish-randall", hometown: "Houston")
user3 = User.create(name: "Chang", username:"chang-chang", hometown: "New York")
user4 = User.create(name: "Fred", username:"funky-fred", hometown: "San Fransisco")
user5 = User.create(name: "Sussie", username:"sneaky-sussie", hometown: "Boston")

exercise1 = Exercise.create(name: "Running", description: "Tiring", category: "cardio")
exercise2 = Exercise.create(name: "BENCH", description: "push heavy weights", category: "strength")
exercise3 = Exercise.create(name: "Downward Dog", description: "Calming", category: "yoga")
exercise4 = Exercise.create(name: "Walking", description: "Relaxing", category: "cardio")
exercise5 = Exercise.create(name: "Hot-Yoga", description: "Weight Loss", category: "yoga")
exercise6 = Exercise.create(name: "Squat", description: "GET BIGG!", category: "stregth")






num1 = UserExercise.create(user_id: user1.id, exercise_id: exercise1.id)
num2 = UserExercise.create(user_id: user1.id, exercise_id: exercise3.id)
num3 = UserExercise.create(user_id: user1.id, exercise_id: exercise4.id)
num4 = UserExercise.create(user_id: user2.id, exercise_id: exercise1.id)
num5 = UserExercise.create(user_id: user2.id, exercise_id: exercise4.id)
num6 = UserExercise.create(user_id: user3.id, exercise_id: exercise2.id)
num7 = UserExercise.create(user_id: user4.id, exercise_id: exercise5.id)
num8 = UserExercise.create(user_id: user4.id, exercise_id: exercise1.id)
num9 = UserExercise.create(user_id: user4.id, exercise_id: exercise6.id)
num10 = UserExercise.create(user_id: user5.id, exercise_id: exercise2.id)

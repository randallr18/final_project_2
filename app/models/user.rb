class User < ApplicationRecord
  has_many :user_exercises
  has_many :exercises, through: :user_exercises
  has_many :categories, through: :user_exercises
end

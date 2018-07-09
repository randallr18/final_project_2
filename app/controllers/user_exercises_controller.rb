class UserExercisesController < ApplicationController

  before_action :get_user_exercise, only: [:edit, :update]

  def new
    @userexercise = UserExercise.new
  end

  def create
    # byebug
    @userexercise = UserExercise.new(init_params)
    if @userexercise.save
      redirect_to edit_user_exercise_path(@userexercise)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end


  private

  def init_params
    params.require(:user_exercise).permit(:user_id, :exercise_id)
  end

  def user_exerciser_params
    params.require(:user_exercise).permit(:pace, :distance, :max_weight, :courses_attended, :endurance)
  end

  def get_user_exercise
    @userexercise = UserExercise.find(params[:id])
  end

end

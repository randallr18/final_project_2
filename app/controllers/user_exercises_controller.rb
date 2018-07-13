class UserExercisesController < ApplicationController
  before_action :get_user_exercise, only: [:edit, :update, :show]

  def show
  end


  def new
    @userexercise = UserExercise.new
  end

  def create
    @userexercise = UserExercise.new(init_params)
    @userexercise.user_id = @logged_in_user.id
    if @userexercise.save
      if @userexercise.exercise.name == "Running"
      redirect_to edit_user_exercise_path(@userexercise)
      else
        redirect_to user_path(@logged_in_user)
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @userexercise.update(user_exercise_params)
      redirect_to user_path(@userexercise.user)
    else
      render :edit
    end
  end


  private

  def init_params
    params.require(:user_exercise).permit(:exercise_id, :category_id, :date)
  end

  def user_exercise_params
    params.require(:user_exercise).permit(:pace, :distance)
  end

  def get_user_exercise
    @userexercise = UserExercise.find(params[:id])
  end

end

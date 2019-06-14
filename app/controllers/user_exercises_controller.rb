class UserExercisesController < ApplicationController

  before_action :get_user_exercise, only: [:edit, :update, :show, :destroy]

  def show
  end


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
    if @userexercise.update(user_exercise_params)
      redirect_to user_path(@userexercise.user)
    else
      render :edit
    end
  end

  def destroy
    @userexercise.destroy
    redirect_to user_path(@userexercise.user)
  end


  private

  def init_params
    params.require(:user_exercise).permit(:user_id, :exercise_id, :category_id)
  end

  def user_exercise_params
    params.require(:user_exercise).permit(:progress, :goal, :goal_category)
  end

  def get_user_exercise
    @userexercise = UserExercise.find(params[:id])
  end

end

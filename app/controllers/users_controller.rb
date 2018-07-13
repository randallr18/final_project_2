class UsersController < ApplicationController

  before_action :get_user, only: [:show]
  skip_before_action :authorized?, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user.id)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def choice
  end

  def show
    @calories = @logged_in_user.average_calories_per_day
    @breakdown_hash = @logged_in_user.average_breakdown_food_groups
    @hours_slept = @logged_in_user.average_sleep_per_day
  end

  def month
    @month = params["date"]["month"]
    save_month(@month)
    redirect_to user_display_nutrition_path
  end

  def display
    @month = get_month
    get_logged_in_user
    @all_meals = @logged_in_user.all_meals_for_a_month(@month.to_i)
    delete_month
  end

  def month_sleep
    @month = params["date"]["month"]
    save_month(@month)
    redirect_to user_display_sleep_path
  end

  def display_sleep
    @month = get_month
    get_logged_in_user
    @all_sleeps = @logged_in_user.all_sleeps_for_a_month(@month.to_i)
    delete_month
  end


  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :name, :hometown)
  end


end

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
  end


  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :name, :hometown)
  end

end

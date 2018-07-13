class SleepsController < ApplicationController
  before_action :get_sleep, only: [:edit, :update, :destroy]
  def new
    @sleep = Sleep.new
  end

  def create
    byebug
    @sleep = Sleep.new(sleep_params)
    @sleep.user_id = @logged_in_user.id
    if @sleep.save
      redirect_to user_path(@logged_in_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sleep.update(sleep_params_edit)
      redirect_to user_path(@logged_in_user)
    else
      render :edit
    end
  end

  def destroy
    @sleep.destroy
    redirect_to user_path(@logged_in_user)
  end

  private

  def sleep_params
    params.require(:sleep).permit(:hours, "date(1i)", "date(2i)", "date(3i)")
  end

  def sleep_params_edit
    params[:sleep][:hours] = params[:sleep][:hours].to_i
    params.require(:sleep).permit(:hours)
  end

  def get_sleep
    @sleep = Sleep.find(params[:id])
  end

end

class SleepsController < ApplicationController
  def new
    @sleep = Sleep.new
  end

  def create
    @sleep = Sleep.new(sleep_params)
    @sleep.user_id = @logged_in_user.id
    if @sleep.save
      redirect_to user_path(@logged_in_user)
    else
      render :new
    end
  end

  private

  def sleep_params
    params.require(:sleep).permit(:hours, "date(1i)", "date(2i)", "date(3i)")
  end
end

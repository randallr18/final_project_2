class ApplicationController < ActionController::Base
  before_action :authorized?

  private

  def save_month(month)
    session[:month] = month
  end

  def get_month
    @month = session[:month]
  end

  def delete_month
    session[:month] = nil
  end

  def log_in_user(user_id)
    session[:user_id] = user_id
  end

  def logged_in_user_id
    session[:user_id]
  end

  def get_logged_in_user
    @logged_in_user = User.find(logged_in_user_id) if logged_in_user_id
  end

  def authorized?
    redirect_to new_session_path unless !!get_logged_in_user
  end

  def log_out
    session[:user_id] = nil
  end


end

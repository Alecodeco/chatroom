class ApplicationController < ActionController::Base

  helper_method :current_user, :current_controller, :logged_in?, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def current_controller?(names)
    names.include?(current_controller)
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:yellow] = "Please, log in first."
      redirect_to login_path
    end
  end

  def require_same_user
    if current_user != @user
      flash[:red] = "Must be logged in for that."
      redirect_to root_path
    end
  end


end

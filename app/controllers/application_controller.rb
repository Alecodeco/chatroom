class ApplicationController < ActionController::Base
  include MarkdownHelper

  helper_method :current_user, :current_controller, :logged_in?, :require_user,
                :toggle_superuser, :current_superuser?, :require_superuser

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def logged_in?
    !!current_user
  end

  def toggle_superuser(user)
    user.toggle(:superuser).save
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

  def require_superuser
    if !current_user.superuser
      flash[:red] = "Need Superuser to do that."
      redirect_to root_path
    end
  end

  



end

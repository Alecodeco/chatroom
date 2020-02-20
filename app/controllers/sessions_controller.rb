class SessionsController < ApplicationController
  before_action :set_offline, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      user.update_attribute(:status, "Online")
      flash[:green] = "Successfully logged in as '#{user.username}'. Welcome back!"
      redirect_to root_path
    else
      flash.now[:red] = "There was something wrong with your login info."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:green] = "Logged out."
    redirect_to login_path
  end

  private
  def set_offline
    current_user.update_attribute(:status, "Offline")
  end

end

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:green] = "Successfully logged in as #{user.username}. Welcome back!"
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

end

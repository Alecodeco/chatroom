class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.new(user_params)
      flash[:succeed] = "Successfully created. Welcome!"
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end

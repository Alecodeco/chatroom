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
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.status = "Online"
      flash[:success] = "Account successfully created. Welcome '#{@user.username}'!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update    
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :status)
  end


end

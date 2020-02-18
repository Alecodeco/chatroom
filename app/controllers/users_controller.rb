class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def set_busy
    if current_user.update_attribute(:status, "Busy")
      flash[:red] = "Status changed : 'Busy' "
    end
  end

  def set_away
    if current_user.update_attribute(:status, "Away")
      flash[:yellow] = "Status changed : 'Away' "
    end
  end

  def set_online
    if current_user.update_attribute(:status, "Online")
      flash[:green] = "Status changed : 'Online' "
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def show
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
    if @user.update(user_params)
      flash[:green] = "Changes saved successfully"
      redirect_to user_path
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation,:description, :status)
  end

  def require_same_user
    if logged_in? && current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


end

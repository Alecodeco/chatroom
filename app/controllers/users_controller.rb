class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

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
    set_normal_user(@user)
    if @user.save
      session[:user_id] = @user.id
      @user.update_attribute(:status, "Online")
      flash[:green] = "Account successfully created. Welcome '#{@user.username}'!"
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

  def change_status
    respond_to do |format|
      current_user.update_attribute(:status, params[:status])
      format.js { render js: "$('#current-status-nav').load(location.href + ' #current-status-tag');" }
    end
  end

  def toggle_dark_mode
    respond_to do |format|
      current_user.toggle!(:has_dark_active)
      format.js { render inline: "location.reload();" }
    end
  end

  private
  def user_params
     params.require(:user).permit(:username, :password, :password_confirmation, :description, :status)
  end

  def set_normal_user(user)
    user.superuser = false
  end

  def require_same_user
    if logged_in? && current_user != @user
      flash[:red] = "You can only edit your own account"
      redirect_to root_path
    end
  end


end

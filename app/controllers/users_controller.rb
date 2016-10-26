class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:success] = "You created a new account!"
    elsif User.find_by(email: @user.email)
      redirect_to login_path
      flash[:error] = "User already exists. Please login."
    else
      flash.now[:error] = "Please fill in all fields."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

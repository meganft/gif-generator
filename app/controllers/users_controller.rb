class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
      flash[:success] = "You created a new account!"
    elsif User.find_by(email: @user.email)
      flash.now[:error] = "User already exitsts. Please login."
      redirect_to login_path
    else
      flash.now[:error] = "Please fill in all fields."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end

end

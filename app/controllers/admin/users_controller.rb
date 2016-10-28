class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
      flash[:success] = "Successfully created new user!"
    elsif User.find_by(email: @user.email)
      flash.now[:error] = "User already exists, please try again."
      render :new
    else
      flash.now[:error] = "Remember to fill in all fields before submitting new user."
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      flash[:msg] = "You successfully logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:msg] = "Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:msg] = "You successfully logged out!"
    redirect_to login_path
  end

end

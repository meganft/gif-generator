class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password_digest])
    unless @user.nil?
      session[:user_id] = @user.id
      flash[:msg] = "You successfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:msg] = "Please try again."
      redirect_to login_path
    end
  end

end

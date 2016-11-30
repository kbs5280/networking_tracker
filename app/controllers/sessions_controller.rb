class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'Login successful!'
    else
      flash.now[:danger] = user.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

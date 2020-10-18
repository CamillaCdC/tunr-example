class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    # if the user exists and the bycrypt(params[:password]) == password_Digest
    if user.present? && user.authenticate(params[:password])
      # save the user in the session
      session[:user_id] = user.id
      redirect_to root_path
    # else
    else
      # invalid username or password
      # redisplay login
      # set error message
      flash[:error] = "Invalid username or password"
      redirect_to login_path # display error message here
    #end
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to login_path
  end

end
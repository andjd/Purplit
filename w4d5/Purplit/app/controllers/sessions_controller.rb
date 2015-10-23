class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:name], params[:user][:password])
    unless user.nil?
      log_in!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      @user = User.new name: params[:user][:name]
      render :new
    end

  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

end #class

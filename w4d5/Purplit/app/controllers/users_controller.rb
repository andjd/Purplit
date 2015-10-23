class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

    # def destroy
    #   if current_user.destroy
    #     redirect_to new_user_url
    #   else
    #     flash.
    # end

private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end

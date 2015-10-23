class SubsController < ApplicationController

  before_action :require_moderator, only: [:edit]

  def index
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])


    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator
    @sub = Sub.find(params[:id])
    unless current_user == @sub.moderator
      flash[:errors]= ["Unauthorized access"]
      redirect_to sub_url(@sub)
    end
  end

end

class SubsController < ApplicationController

  def index
  end

  def new
    @sub = current_user.subs.new
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
    @sub = Sub.find_by_id(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

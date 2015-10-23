class PostsController < ApplicationController

  def new
    sub = Sub.find(params[:sub_id])
    @post = sub.posts.new
    render :new
  end


  # subs/:sub_id/posts
  # params[:sub_id]
  #
  # params[:post][:sub_id]
  def create

    # sub = Sub.find(params[:sub_id])
    # @post = sub.posts.new(post_params)
    @post = current_user.posts.new(post_params)
    # @post.author = current_user
    if @post.save
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end


private

  def post_params
    if params[:post][:post_type] == "url"
      params.require(:post).permit(:title, :url, :sub_id)
    else
      params.require(:post).permit(:title, :content, :sub_id)
    end
  end

end

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    if current_user
      @post = Post.create(
                          user_id: current_user.id,
                          title: params[:title],
                          body: params[:body],
                          category_id: params[:category][:category_id]
                          )
      redirect_to "/post/#{@post.id}"
    else
      flash[:info] = "You must be signed in to make a post"
      redirect_to "/"
    end
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def update
    @post = Post.find(params[:id])
    @categories = Category.where(user_id: current_user.id)

    if current_user && current_user.id == @post.user_id
      @post.title = params[:title]
      @post.body = params[:body]
      @post.category_id = params[:category][:category_id]

      @post.save
      flash[:success] = "Post updated"
      redirect_to "/post/#{@post.id}"
    else
      flash[:warning] = "You can only edit your own posts"
      redirect_to "/post/#{@post.id}"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if current_user && current_user.id == @post.user_id
      @post.destroy
      flash[:success] = "Post removed"
      redirect_to '/'
    else
      flash[:warning] = "You can only delete your own posts"
      redirect_to "/post/#{@post.id}"
    end
  end

  def user_post
    @posts = Post.where(user_id: current_user.id)
  end
end

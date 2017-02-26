class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    if current_user
      @category = Category.create(
                                  category: params[:category],
                                  user_id: current_user.id
                                  )
      @category.save

      flash[:success] = "Category Added"
      redirect_to "/post_user"
    else
      flash[:warning] = "You must log in to create categories"
      redirect_to "/login"
    end
  end

end

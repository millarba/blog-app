class UsersController < ApplicationController

  def new

  end

  def create
    user = User.create(
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account successfully created"
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end


end

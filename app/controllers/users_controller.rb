class UsersController < ApplicationController

  def index
    @users = User.all  
  end

  def show
    @user = User.find_by_name(params[:name]) || User.find(params[:id])
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to brewme!"
      redirect_to @user
    else
      render 'new'
    end
  end

end

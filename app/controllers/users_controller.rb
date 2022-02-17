class UsersController < ApplicationController
  def index
    @users = User.includes(:contacts)
  end

  def show
    @user = User.includes(:contacts, :phones).find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :age, :biography)
  end
end

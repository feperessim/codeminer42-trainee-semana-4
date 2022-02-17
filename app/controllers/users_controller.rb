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
    @user = User.includes(:contacts, :phones).find_by(id: params[:id])
  end

  def update
    @user = User.includes(:contacts, :phones).find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.includes(:contacts, :phones).find_by(id: params[:id])
    @user.destroy

    redirect_to @user
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :age, :biography)
  end
end

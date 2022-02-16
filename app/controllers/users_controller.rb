class UsersController < ApplicationController
  def index
    @users = User.includes(:contacts)
  end

  def show
    @user = User.includes(:contacts, :phones).find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

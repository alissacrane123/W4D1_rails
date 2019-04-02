class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end 

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: unprocessable_entity 
    end 
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: 200
    else 
      render json: 'user does not exist', status: 422
    end 
  end

  def update
    @user = User.find(params[:id])
    if !@user 
      render json: @user.errors.full_messages, status: 418
    else 
      @user.update!(user_params)
      render json: @user
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

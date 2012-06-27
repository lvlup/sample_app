class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
   end


def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      @title = "Зарегистрироваться"
      render 'new'
    end
  end
end


# encoding: utf-8

class UsersController < ApplicationController
 before_filter :authenticate, :only => [:edit, :update]
 before_filter :correct_user, :only => [:edit, :update]
 before_filter :admin_user,   :only => :destroy

   def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page],:per_page => 20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page],:per_page => 5)
    @title = @user.name

    @comment = Comment.new

  end  

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to users_path
  end

  def new
    @user = User.new
    @title = "Зарегистрироваться"
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

  def edit
   
    @title = "Редактирование пользователя"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Профиль обновлен."
      redirect_to @user
    else
      @title = "Редактировать пользователя"
      render 'edit'
    end
  end
 
 private

   
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
   def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end


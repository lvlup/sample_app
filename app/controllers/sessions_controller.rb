
class SessionsController < ApplicationController
# encoding: utf-8
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password**]**)
    if user.nil?
      flash.now[:error] = "Неправильная email/пароль комбинация."
      @title = "Войти"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end

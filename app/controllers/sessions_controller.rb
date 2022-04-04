class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/index'
    else
       redirect_to '/welcome'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Vous avez bien été déconnecté"
  end

  def welcome
  end

  def login
  end

  def page_required_login
  end



end

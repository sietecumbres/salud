class UsersController < ApplicationController

  before_filter :require_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(users_path, :notice => 'Usuario creado correctamente.')
    else
      render :action => "new"
    end
  end

end

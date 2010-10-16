class UsersController < ApplicationController

  before_filter :require_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(users_path, :notice => 'Usuario creado correctamente.')
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(users_path, :notice => 'Usuario actualizado correctamente')
    else
      render :action => "edit"
    end
  end

end

class EstadosController < ApplicationController

  before_filter :require_user

  def index
    @estados = Estado.all
  end

  def new
    @estado = Estado.new
  end

  def edit
    @estado = Estado.find(params[:id])
  end

  def create
    @estado = Estado.new(params[:estado])
    if @estado.save
      redirect_to estados_url
    else
      render :action => "new"
    end
  end

  def update
    @estado = Estado.find(params[:id])
    if @estado.update_attributes(params[:estado])
      redirect_to estados_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @estado = Estado.find(params[:id])
    @estado.destroy
    redirect_to estados_url
  end
end

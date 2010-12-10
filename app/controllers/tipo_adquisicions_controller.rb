class TipoAdquisicionsController < ApplicationController

  before_filter :require_user
  
  def index
    @tipo_adquisicions = TipoAdquisicion.all
  end

  def show
    @tipo_adquisicion = TipoAdquisicion.find(params[:id])
  end

  def new
    @tipo_adquisicion = TipoAdquisicion.new
  end

  def edit
    @tipo_adquisicion = TipoAdquisicion.find(params[:id])
  end

  def create
    @tipo_adquisicion = TipoAdquisicion.new(params[:tipo_adquisicion])
    if @tipo_adquisicion.save
      redirect_to tipo_adquisicions_url
    else
      render :action => "new"
    end
  end

  def update
    @tipo_adquisicion = TipoAdquisicion.find(params[:id])
    if @tipo_adquisicion.update_attributes(params[:tipo_adquisicion])
      redirect_to tipo_adquisicions_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @tipo_adquisicion = TipoAdquisicion.find(params[:id])
    @tipo_adquisicion.destroy
     redirect_to tipo_adquisicions_url
  end
end

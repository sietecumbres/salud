class TipoInsumosController < ApplicationController

  before_filter :require_user
  
  def index
    @tipo_insumos = TipoInsumo.all
  end

  def show
    @tipo_insumo = TipoInsumo.find(params[:id])
  end

  def new
    @tipo_insumo = TipoInsumo.new
  end

  def edit
    @tipo_insumo = TipoInsumo.find(params[:id])
  end

  def create
    @tipo_insumo = TipoInsumo.new(params[:tipo_insumo])
    if @tipo_insumo.save
      redirect_to(@tipo_insumo)
    else
      render :action => "new"
    end
  end

  def update
    @tipo_insumo = TipoInsumo.find(params[:id])
    if @tipo_insumo.update_attributes(params[:tipo_insumo])
      redirect_to(@tipo_insumo)
    else
      render :action => "edit"
    end
  end

  def destroy
    @tipo_insumo = TipoInsumo.find(params[:id])
    @tipo_insumo.destroy
    redirect_to(tipo_insumos_url)
  end
end

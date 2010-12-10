class ProveedorInsumosController < ApplicationController

  before_filter :require_user
  
  def index
    @proveedor_insumos = ProveedorInsumo.all
  end

  def show
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
  end

  def new
    @proveedor_insumo = ProveedorInsumo.new
  end

  def edit
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
  end

  def create
    @proveedor_insumo = ProveedorInsumo.new(params[:proveedor_insumo])
    if @proveedor_insumo.save
      redirect_to(@proveedor_insumo)
    else
      render :action => "new"
    end
  end

  def update
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
    if @proveedor_insumo.update_attributes(params[:proveedor_insumo])
      redirect_to(@proveedor_insumo)
    else
      render :action => "edit"
    end
  end

  def destroy
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
    @proveedor_insumo.destroy
    redirect_to(proveedor_insumos_url)
  end
end

class ProveedorEquiposController < ApplicationController

  before_filter :require_user

  def index
    @proveedor_equipos = ProveedorEquipo.all
  end

  def new
    @proveedor_equipo = ProveedorEquipo.new
  end

  def edit
    @proveedor_equipo = ProveedorEquipo.find(params[:id])
  end

  def create
    @proveedor_equipo = ProveedorEquipo.new(params[:proveedor_equipo])
      if @proveedor_equipo.save
        redirect_to proveedor_equipos_url
      else
        render :action => "new"
      end
  end

  def update
    @proveedor_equipo = ProveedorEquipo.find(params[:id])
    if @proveedor_equipo.update_attributes(params[:proveedor_equipo])
      redirect_to proveedor_equipos_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @proveedor_equipo = ProveedorEquipo.find(params[:id])
    @proveedor_equipo.destroy
    redirect_to proveedor_equipos_url
  end
end

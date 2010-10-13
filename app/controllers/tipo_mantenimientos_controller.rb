class TipoMantenimientosController < ApplicationController

  def index
    @tipo_mantenimientos = TipoMantenimiento.all
  end

  def show
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])
  end

  def new
    @tipo_mantenimiento = TipoMantenimiento.new
  end

  def edit
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])
  end

  def create
    @tipo_mantenimiento = TipoMantenimiento.new(params[:tipo_mantenimiento])

    if @tipo_mantenimiento.save
      redirect_to(@tipo_mantenimiento, :notice => 'Tipo mantenimiento fue creado.')
    else
      render :action => "new"
    end
  end

  def update
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])

    if @tipo_mantenimiento.update_attributes(params[:tipo_mantenimiento])
      redirect_to(@tipo_mantenimiento, :notice => 'Tipo mantenimiento fue actualizado')
    else
      render :action => "edit"
    end
  end

  def destroy
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])
    @tipo_mantenimiento.destroy
    redirect_to(tipo_mantenimientos_url)
  end
end

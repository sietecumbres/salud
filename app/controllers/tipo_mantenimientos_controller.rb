class TipoMantenimientosController < ApplicationController
  
  before_filter :require_user

  def index
    @tipo_mantenimientos = TipoMantenimiento.all
  end

  def show
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])
  end

  def new
    @tipo_mantenimiento = TipoMantenimiento.new :color => '#0000ff'
  end

  def edit
    @tipo_mantenimiento = TipoMantenimiento.find(params[:id])
		@tipo_mantenimiento.color = @tipo_mantenimiento.color ? @tipo_mantenimiento.color : '#0000ff'
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
		flash[:notice] = "Tipo de mantenimiento eliminado con exito!"
    redirect_to(tipo_mantenimientos_url)
  end
end

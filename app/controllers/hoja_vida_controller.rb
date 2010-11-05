class HojaVidaController < ApplicationController

  before_filter :require_user
  
  def show
		@tipos = TipoMantenimiento.all
		@tipo = TipoMantenimiento.first
		@year = params[:year].nil? ? Date.today.year : params[:year]
		@agendas = current_equipo.agendas
    @equipo = Equipo.find(params[:id])
  end

  def mostrar_mantenimiento
		@tipos = TipoMantenimiento.all
    @equipo = current_equipo
    @tipo = TipoMantenimiento.find(params[:tipo_mantenimiento])
    @anio = params[:anio]
    render :layout => false

  end

	def new
		hoja_vida = HojaVida.new
	end

end

class HojaVidaController < ApplicationController

  before_filter :require_user
  
  def show
		@tipos = TipoMantenimiento.all
		@year = params[:year].nil? ? Date.today.year : params[:year]
		@agendas = current_equipo.agendas
    @equipo = Equipo.find(params[:id])
  end

  def mostrar_mantenimiento
    @equipo = Equipo.find(params[:id])
    render :partial => 'hoja_vida/mantenimiento', :locals => {:equipos => @equipo, :year => params[:anio], :tipos => params[:tipo_mantenimiento]}

  end

end

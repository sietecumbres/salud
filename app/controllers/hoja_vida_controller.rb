class HojaVidaController < ApplicationController

  before_filter :require_user
  
  def show
		@tipos = TipoMantenimiento.all
		@year = params[:year].nil? ? Date.today.year : params[:year]
		@agendas = current_equipo.agendas
    @equipo = Equipo.find(params[:id])
  end

end

class EquiposController < ApplicationController
  def index
    @equipos = Equipo.all
    @tipos = TipoEquipo.all
    @subtipos = SubtipoEquipo.all
    @adquisiciones = TipoAdquisicion.all
    @responsables = Persona.all
    @areas = Area.all
    
    @adquisiciones << TipoAdquisicion.new({:id => '', :nombre => 'Otro'})
  end
  
  def search
    
  end
  
  def autocomplete
    t = Equipo.arel_table
    equipos = Equipo.select('modelo').where(t[:modelo].matches("#{params[:q]}%")).map{|equipo| equipo.modelo}
    logger.debug "equipos => #{equipos.inspect}"
    render :text => equipos.join(","), :layout => false
  end

end

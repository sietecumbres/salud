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
    equipos = Equipos.select('modelo').where(['modelo like ?%', params[:q]])
    logger.debug "equipos => #{equipos.inspect}"
    render :text => equipo.join(","), :layout => false
  end

end

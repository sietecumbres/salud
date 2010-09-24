class EquiposController < ApplicationController
  def index
    @equipos = Equipo.all
  end
  
  def search
    equipos = Equipos.select('modelo').where(['modelo like ?%', params[:q]])
    logger.debug "equipos => #{equipos.inspect}"
    render :text => equipo.join(","), :layout => false
  end

end

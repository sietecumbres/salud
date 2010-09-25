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
    field = params[:term].to_sym
    t = Equipo.arel_table
    equipos = Equipo.select(field).where(t[field].matches("#{params[:q]}%")).map{|equipo| equipo.modelo}
    render :text => equipos.join(","), :layout => false
  end

end

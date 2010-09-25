class EquiposController < ApplicationController
  before_filter :get_options, :only => [:index, :search]
  def index
    @equipos = Equipo.all
  end
  
  def search
    persona = Persona.where(:id => params[:busqueda][:persona_id])
    tipo = TipoEquipo.where(:id => params[:busqueda][:tipo_equipo_id])
    subtipo = SubtipoEquipo.where(:id => params[:busqueda][:subtipo_equipo_id])
    adquisicion = TipoAdquisicion.where(:id => params[:busqueda][:tipo_adquisicion_id])
    otro = TipoAdquisicion.where(:id => params[:busqueda][:persona_id])
    @equipos = Equipo.all
    render :action => :index
  end
  
  def autocomplete
    equipos = Equipos.select('modelo').where(['modelo like ?%', params[:q]])
    logger.debug "equipos => #{equipos.inspect}"
    render :text => equipo.join(","), :layout => false
  end

  protected
    def get_options
      @tipos = TipoEquipo.all
      @subtipos = SubtipoEquipo.all
      @adquisiciones = TipoAdquisicion.all
      @responsables = Persona.all
      @areas = Area.all

      @adquisiciones << TipoAdquisicion.new({:id => '', :nombre => 'Otro'})
    end
end

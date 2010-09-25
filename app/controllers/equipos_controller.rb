class EquiposController < ApplicationController
  before_filter :get_options, :only => [:index, :search]
  def index
    @equipos = Equipo.all
  end
  
  def search
    t = Equipo.arel_table
    adquisicion = params[:busqueda][:tipo_adquisicion_id].nil? ?  params[:busqueda][:otro_adquisicion] :  params[:busqueda][:tipo_adquisicion_id]
    condiciones = {}
    condiciones.merge({:area_id => params[:busqueda][:area_id]}) unless params[:busqueda][:area_id].nil?
    condiciones.merge({:tipo_equipo_id => params[:busqueda][:tipo_equipo_id]}) unless params[:busqueda][:tipo_equipo_id].nil?
    condiciones.merge({:subtipo_equipo_id => params[:busqueda][:subtipo_equipo_id]}) unless params[:busqueda][:subtipo_equipo_id].nil?
    condiciones.merge({:tipo_adquisicion_id => adquisicion}) unless adquisicion.nil?
    condiciones.merge({:responsable_id => params[:busqueda][:persona_id]}) unless params[:busqueda][:persona_id].nil?

    @equipos = Equipo.where(condiciones)

    render :action => :index
  end
  
  def autocomplete
    t = Equipo.arel_table
    equipos = Equipo.select('modelo').where(t[:modelo].matches("#{params[:q]}%")).map{|equipo| equipo.modelo}
    logger.debug "equipos => #{equipos.inspect}"
    render :text => equipos.join(","), :layout => false
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

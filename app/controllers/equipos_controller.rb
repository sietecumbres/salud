class EquiposController < ApplicationController
  before_filter :get_options, :only => [:index, :search]
  def index
    
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
    condiciones.merge({:modelo => params[:busqueda][:modelo]}) unless params[:busqueda][:modelo].nil?
    condiciones.merge({:marca => params[:busqueda][:marca]}) unless params[:busqueda][:marca].nil?
    condiciones.merge({:serial => params[:busqueda][:serial]}) unless params[:busqueda][:serial].nil?
    condiciones.merge({:placa => params[:busqueda][:placa]}) unless params[:busqueda][:placa].nil?
     logger.debug "condiciones #{condiciones.inspect}"
    @equipos_search = Equipo.where(condiciones)

    render :action => :index
  end
  
  def autocomplete
    field = params[:term].to_sym
    t = Equipo.arel_table
    equipos = Equipo.select(field).where(t[field].matches("%#{params[:q]}%")).map{|equipo| equipo.attributes[field.to_s]}
    render :text => equipos.join(","), :layout => false
  end

  protected
    def get_options
      @tipos = TipoEquipo.all
      @subtipos = SubtipoEquipo.all
      @adquisiciones = TipoAdquisicion.all
      @responsables = Persona.all
      @areas = Area.all
       @equipos = Equipo.all
      @adquisiciones << TipoAdquisicion.new({:id => '', :nombre => 'Otro'})
    end
end

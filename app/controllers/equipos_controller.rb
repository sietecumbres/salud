class EquiposController < ApplicationController

  before_filter :require_user, :get_options, :only => [:index, :search]

  def index
    @busqueda = Equipo.new params[:equipo] unless params[:equipo]
    @busqueda ||= Equipo.new
  end
  
  def search
    @busqueda = Equipo.new params[:equipo]
    logger.debug "Equipo => #{@busqueda.inspect}"
    adquisicion = params[:equipo][:tipo_adquisicion_id].empty? ?  params[:otro_adquisicion] :  params[:equipo][:tipo_adquisicion_id]
    condiciones = {}
    condiciones = condiciones.merge({:area_id => params[:equipo][:area_id]}) unless params[:equipo][:area_id].empty?
    condiciones = condiciones.merge({:tipo_equipo_id => params[:equipo][:tipo_equipo_id]}) unless params[:equipo][:tipo_equipo_id].empty?
    condiciones = condiciones.merge({:subtipo_equipo_id => params[:equipo][:subtipo_equipo_id]}) unless params[:equipo][:subtipo_equipo_id].empty?
    condiciones = condiciones.merge({:tipo_adquisicion_id => adquisicion}) unless adquisicion.empty?
    condiciones = condiciones.merge({:responsable_id => params[:equipo][:responsable_id]}) unless params[:equipo][:responsable_id].empty?
    condiciones = condiciones.merge({:modelo => params[:equipo][:modelo]}) unless params[:equipo][:modelo].empty?
    condiciones = condiciones.merge({:marca => params[:equipo][:marca]}) unless params[:equipo][:marca].empty?
    condiciones = condiciones.merge({:serial => params[:equipo][:serial]}) unless params[:equipo][:serial].empty?
    condiciones = condiciones.merge({:placa => params[:equipo][:placa]}) unless params[:equipo][:placa].empty?
    @equipos = Equipo.where(condiciones).all
    @equipos.reject!{|equipo| equipo.valor < params[:valor_min].to_i or equipo.valor > params[:valor_max].to_i} unless params[:valor_min].empty? and params[:valor_max].empty?
		@colors = Equipo.colors @equipos
    render :action => :index
  end
  
  def autocomplete
    field = params[:table].to_sym
    t = Equipo.arel_table
    equipos = Equipo.select(field).where(t[field].matches("%#{params[:term]}%")).map{|equipo| equipo.attributes[field.to_s]}
    render :json => equipos.to_json, :layout => false
  end

  def new
    @equipo = Equipo.new
  end

	def list
		@equipos = Equipo.all
	end

	def create
		@equipo = Equipo.new params[:equipo]
		if @equipo.save
			flash[:notice] = "Nuevo equipo creado con éxito."
			redirect_to list_equipos_path
		else
			render :action => :new
		end
	end

	def edit
		@equipo = current_equipo
	end

	def update
		@equipo = current_equipo
		
		if @equipo.update_attributes(params[:equipo])
			flash[:notice] = "Equipo editado con éxito."
			redirect_to list_equipos_path
		else
			render :action => :edit
		end
	end

	def destroy
		if current_equipo.destroy
			flash[:notice] = "Equipo eliminado con éxito."
			redirect_to list_equipos_path
		end
	end

  protected
    def get_options
      @tipos = TipoEquipo.all
      @subtipos = SubtipoEquipo.all
      @adquisiciones = TipoAdquisicion.all
      @responsables = Persona.all
      @areas = Area.all
      @equipos = Equipo.all unless @equipos.present?
			@colors = Equipo.all_colors unless @colors.present?
      @adquisiciones << TipoAdquisicion.new({:id => '', :nombre => 'Otro'})
    end
end

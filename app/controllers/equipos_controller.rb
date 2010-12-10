class EquiposController < ApplicationController
  before_filter :get_options, :only => [:index, :search]
  before_filter :require_user

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
    condiciones = condiciones.merge({:nombre => params[:equipo][:nombre]}) unless params[:equipo][:nombre].empty?
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
		@equipo.hoja_vida = HojaVida.new
  end

	def list
    #@busqueda = Equipo.new params[:equipo] unless params[:equipo]
    #@busqueda ||= Equipo.new
		@equipos = Equipo.all
	end

	def create
		area = current_lab.areas.where(:id => params[:equipo][:area_id]).first
		
		params[:hoja_vida].merge(:manual_operacion => '0') unless params[:hoja_vida][:manual_operacion]
		
		equipo = Equipo.create params[:equipo]
		equipo.hoja_vida = HojaVida.create params[:hoja_vida]
		equipo.save
		
		area.equipos << equipo
		
		entrada = EntradaEquipo.new
		entrada.equipo = area.equipos.last
		entrada.laboratorio = current_lab
		entrada.fecha_movimiento = Date.today
		entrada.save
		
		flash[:notice] = "Nuevo equipo creado con éxito."
		redirect_to list_equipos_path
	end

	def edit
		@equipo = current_equipo
	end

	def update
		params[:hoja_vida].merge(:manual_operacion => '0') unless params[:hoja_vida][:manual_operacion]
		@equipo = current_equipo
		if @equipo.update_attributes(params[:equipo]) && @equipo.hoja_vida.update_attributes(params[:hoja_vida])
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

	def show
		@equipo = current_equipo
	end

	def dar_salida
		unless params[:destino].blank?
			movimiento = SalidaEquipo.new :equipo_id => current_equipo.id,
																		:laboratorio => params[:destino],
																		:fecha_movimiento => Date.today
			if movimiento.save
				flash[:notice] = "Se ha dado salida al equipo #{current_equipo.placa} al laboratorio #{movimiento.laboratorio}"
				redirect_to list_equipos_path
			end
		else
			flash[:notice] = "Debe definir un destino para poder dar salida"
			redirect_to list_equipos_path
		end
	end
	
	def cambiar_area
		area = Area.where(:id => params[:destino]).first
		movimiento = SalidaEquipo.new :equipo_id => current_equipo.id,
																	:area_id => area.id,
																	:fecha_movimiento => Date.today
		if movimiento.save
			flash[:notice] = "Se ha cambiado de área al equipo #{current_equipo.placa} a #{area.nombre}"
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

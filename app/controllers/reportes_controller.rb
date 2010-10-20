class ReportesController < ApplicationController

  before_filter :require_user
  
  def show
    @reporte = ReporteMantenimiento.find(params[:id])
  end

  def new
    @reporte = ReporteMantenimiento.new
    @area = Area.all
    @mantenimientos = TipoMantenimiento.all
    @estados = Estado.all
    @repuestos = Repuesto.all
    @responsables = Persona.all
    @equipo = Equipo.find(params[:equipo_id])
    @mantenimientos << TipoMantenimiento.new({:id => '', :nombre => 'Otro'})
  end

  def create
		agenda = Agenda.where(:id => params[:id]).first
    reporte = ReporteMantenimiento.create(
      {
        :equipo_id => params[:equipo_id],
        :tipo_mantenimiento_id => agenda.tipo_mantenimiento_id,
        :evaluacion_diagnostico => params[:eval],
        :descripcion_servicio => params[:descripcion],
        :agenda_id => agenda.id,
				:prestador_mantenimiento_id => current_user.id
      }
    )
    params[:estados].each {|estado, evaluacion| reporte.estado_equipos << EstadoEquipo.create(evaluacion.merge({:estado_id => estado}))}
    params[:repuestos].each do |repuesto, values|
      repuesto = Repuesto.where(:referencia => values[:ref]).first
      reporte.repuesto_equipos << RepuestoEquipo.create({:repuesto_id => repuesto.id, :cantidad => values[:cant], :descripcion => values[:desc]})
    end if params[:repuestos]
    
  end

	def find_by_cc
		persona = Persona.find(:first, :conditions => ['documento = ?', params[:documento]])
		
		if persona
			logger.debug persona.to_json
			render :json => persona.to_json, :layout => false
		else
			render :json => "error".to_json, :layout => false
		end
	end

  def add_estado_equipo
    estado_equipo = EstadoEquipo.new
    estado_equipo.estado_id = params[:estado]
    estado_equipo.resultado = params[:resultado]
    estado_equipo.reporte_mantenimiento_id = params[:reporte]
    estado_equipo.save
    render :text => "ok", :layout => false
  end

  def autocomplete_repuestos
#    field = params[:table].to_sym
#    t = Repuesto.arel_table
#    repuestos = Repuesto.select(field).where(t[field].matches("%#{params[:term]}%")).map{|repuesto| repuesto.attributes[field.to_s]}
    repuestos = Repuesto.select(:referencia).where('referencia like (?)', "%#{params[:term]}%").collect{|repuesto| repuesto.referencia}
    render :json => repuestos.to_json, :layout => false
  end

end

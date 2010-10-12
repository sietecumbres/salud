class ReportesController < ApplicationController
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
    mantenimiento = TipoMantenimiento.create :nombre => params[:otro_mantenimiento] if params[:reporte_mantenimiento][:tipo_mantenimiento_id].blank?
    print persona = Persona.find(:first, :conditions => ['documento = ?', params[:documento]])
    logger.debug "Responsable => #{persona.inspect}"
    reporte = ReporteMantenimiento.create(
      {
        :equipo_id => params[:equipo_id],
        :tipo_mantenimiento_id => params[:reporte_mantenimiento][:tipo_mantenimiento_id].blank? ? mantenimiento.id : params[:reporte_mantenimiento][:tipo_mantenimiento_id],
        :evaluacion_diagnostico => params[:eval],
        :descripcion_servicio => params[:descripcion],
        :agenda_id => params[:id],
        :responsable_id => params[:reporte_mantenimiento][:responsable_id].blnak? ? persona.id : params[:reporte_mantenimiento][:responsable_id]
      }
    )
    params[:estados].each {|estado, evaluacion| reporte.estado_equipos << EstadoEquipo.create(evaluacion.merge({:estado_id => estado}))}
    params[:repuestos].each { |repuesto, value| reporte.repuesto_equipos << RepuestoEquipo.create({:repuesto_id => repuesto, :cantidad => cantidad}) }


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

end

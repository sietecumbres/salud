class ReportesController < ApplicationController
  def show
    @reporte = ReporteMantenimiento.find(params[:id])
  end

  def new
    @reporte = ReporteMantenimiento.create
    @mantenimientos = TipoMantenimiento.all
    @estados = Estado.all
    @repuestos = Repuesto.all
    @responsables = Persona.all
    @equipo = Equipo.find(params[:id])
    @mantenimientos << TipoMantenimiento.new({:id => '', :nombre => 'Otro'})
  end

  def create
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

class ReportesController < ApplicationController
  def show
    @reporte = ReporteMantenimiento.find(params[:id])
  end

  def new
    @reporte = ReporteMantenimiento.new
    @mantenimientos = TipoMantenimiento.all
    @estados = Estado.all
    @repuestos = Repuesto.all
    @responsables = Persona.all
    @equipos = Equipo.all
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

end

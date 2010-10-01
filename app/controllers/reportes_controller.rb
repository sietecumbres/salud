class ReportesController < ApplicationController
  def show
    @reporte = ReporteMantenimiento.find(params[:id])
  end

  def new
    @reporte = ReporteMantenimiento.new
    @mantenimientos = TipoMantenimiento.all
    @estados = Estado.all
    @responsables = Persona.all
    @equipos = Equipo.all
    @mantenimientos << TipoMantenimiento.new({:id => '', :nombre => 'Otro'})
  end

  def create
  end

end

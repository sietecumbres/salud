class ReportesController < ApplicationController
  def show
    @reporte = ReporteMantenimiento.find(params[:id])
  end

  def new
  end

  def create
  end

end

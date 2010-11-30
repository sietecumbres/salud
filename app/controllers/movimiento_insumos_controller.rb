class MovimientoInsumosController < ApplicationController

  before_filter :require_user
  
  def index
    @movimiento_insumo = MovimientoInsumo.new
  end

  def create
    @movimiento_insumo = MovimientoInsumo.new(params[:movimiento_insumo])
    @insumo = Insumo.new(params[:insumo].merge(:tipo_insumo_id => params[:tipo_insumo]))
    redirect_to :action => "index" if @movimiento_insumo.save && @insumo.save
  end

end

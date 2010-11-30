class MovimientoInsumosController < ApplicationController

  before_filter :require_user
  
  def entrada
    @movimiento_insumo = MovimientoInsumo.new
    @tipo_movimiento = TipoMovimiento.find_by_nombre("Entrada")
  end

  def crear_entrada
    @movimiento_insumo = MovimientoInsumo.new(params[:movimiento_insumo])
    @insumo = Insumo.new(params[:insumo].merge(:tipo_insumo_id => params[:tipo_insumo]))
    redirect_to :action => "entrada" if @movimiento_insumo.save && @insumo.save
  end

  def salida
    @movimiento_insumo = MovimientoInsumo.new
    @tipo_movimiento = TipoMovimiento.find_by_nombre("Salida")
  end

  def crear_salida
    
  end

end
